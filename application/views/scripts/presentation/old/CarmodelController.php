<?php

class CarModelController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {

        $sess_make = new Zend_Session_Namespace('make');
        $sess_year = new Zend_Session_Namespace('year');

        $req = $this->getRequest();
        $sess_make->makeId = $req->getParam('makeId');
        $sess_make->makeIcon = $req->getParam('makeIcon');
        $sess_year->yearId = $req->getParam('yearId');
        $sess_year->year = $req->getParam('year');

        $this->view->year = $sess_year->year;

        $model = new Application_Model_CarModelMapper();
        $models = $model->fetchByMakeIdAndYear($sess_make->makeId, $sess_year->yearId);
        $this->view->models = $models;
    }

    public function adminindexAction() {
        $this->_helper->layout()->setLayout('admin_layout_inner');
        $this->view->messages = $this->_helper->flashMessenger->getMessages();

        $db = $this->getFrontController()->getParam('bootstrap')->getResource('db');
        $select = $db->select();
        $select->from(array('mo' => 'models'), array('model_id', 'model_name','model_image'))
                ->join(array('mk' => 'makes'), 'mk.make_id = mo.make_id', array('make_name'))
                ->join(array('y' => 'years'), 'y.year_id = mo.year_id', array('year'));
            $stmt = $select->query();
            $resultSet = $stmt->fetchAll();
            $arr = array();

            foreach($resultSet as $row){           
            $arr[]  =   $row;
            }

        $this->view->arr = $arr;
    }

    public function addAction() {
        // action body
        $this->_helper->layout()->setLayout('admin_layout_inner');
        $request = $this->getRequest();
        $form = new Application_Form_CarModel();

        if ($request->isPost() && $form->isValid($request->getPost())) {

            $model = new Application_Model_CarModel($form->getValues());
            $mapper = new Application_Model_CarModelMapper();
            $mapper->save($model);
            $flashMessenger = $this->_helper->FlashMessenger;
            $flashMessenger->addMessage('New Car Model Added Successfully');
            return $this->_helper->redirector('adminindex');
        }
        $form->submit->setLabel('Add Car Model');
        $this->view->form = $form;
    }

    public function editAction() {
        $this->_helper->layout()->setLayout('admin_layout_inner');
        $request = $this->getRequest();
        $form = new Application_Form_CarModel();

        if ($this->getRequest()->isPost()) {
            if ($form->isValid($request->getPost())) {
                $model = new Application_Model_CarModel($form->getValues());
                $mapper = new Application_Model_CarModelMapper();
                $mapper->save($model);
                $flashMessenger = $this->_helper->FlashMessenger;
            $flashMessenger->addMessage('Car Model Updated Successfully');
                return $this->_helper->redirector('adminindex');
            }
            $form->submit->setLabel('Update Model');
            $this->view->form = $form;
        } else {
            $id = $this->_getParam('id', 0);
            if ($id > 0) {
                $modelMapper = new Application_Model_CarModelMapper();
                $modelRet = $modelMapper->fetchById($id);
                $data = array(
                    'modelId' => $modelRet->getModelId(),
                    'makeId' => $modelRet->getMakeId(),
                    'yearId' => $modelRet->getYearId(),
                    'modelName' => $modelRet->getModelName(),
                    'modelImage' => $modelRet->getModelImage()
                );
                $form->populate($data);
                $form->submit->setLabel('Update Model');
                $this->view->form = $form;
            }
        }
    }

    //umopmf	=	update model on price modifier form
    public function umopmfAction() {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $request = $this->getRequest();
        $makeId = $request->getParam('makeId');
        $yearId = $request->getParam('yearId');

        $model = new Application_Model_CarModelMapper();
        $models = $model->fetchByMakeIdAndYear($makeId, $yearId);
        echo '<select name="model" id="model" class="input-field-150" onchange="updateTrim()"><option value="" label="Select..." selected="selected">Select...</option>';
        $retValue = '';
        foreach ($models as $model) {
            if (count($model->getTrims()) > 0) {
                $retValue = '<option value="' . $model->getModelId() . '" label="' . $model->getModelName() . '">' . $model->getModelName() . '</option>';
                echo $retValue;
            }
        } echo '</select>';
    }

    public function deleteAction() {
        // action body
        $id = $this->_getParam('id', 0);

        $mapper = new Application_Model_CarModelMapper();
        $result = $mapper->delete($id);
        return $this->_helper->redirector('adminindex');
    }

}

