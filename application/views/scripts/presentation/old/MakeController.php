<?php

class MakeController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        $make = new Application_Model_MakeMapper();
        $this->view->makes = $make->fetchAll();

        $year = new Application_Model_YearMapper();
        $this->view->years = $year->fetchAll();
    }

    public function adminindexAction() {
        $this->_helper->layout()->setLayout('admin_layout_inner');
        $make = new Application_Model_MakeMapper();
        $this->view->messages = $this->_helper->flashMessenger->getMessages();
        $this->view->makes = $make->fetchAll();
    }

    public function addAction() {
        // action body
        $this->_helper->layout()->setLayout('admin_layout_inner');
        $request = $this->getRequest();
        $form = new Application_Form_Make();

        if ($request->isPost() && $form->isValid($request->getPost())) {

            $make = new Application_Model_Make($form->getValues());
            $mapper = new Application_Model_MakeMapper();
            $mapper->save($make);
            return $this->_helper->redirector('adminindex');
        }
        $form->submit->setLabel('Add Make');
         $flashMessenger = $this->_helper->FlashMessenger;           
         $flashMessenger->addMessage('New Make Entered Successfully');
        $this->view->form = $form;
    }

    public function editAction() {
        $this->_helper->layout()->setLayout('admin_layout_inner');
        $request = $this->getRequest();
        $form = new Application_Form_Make();

        if ($this->getRequest()->isPost()) {
            if ($form->isValid($request->getPost())) {
                $make = new Application_Model_Make($form->getValues());
                $mapper = new Application_Model_MakeMapper();
                $mapper->save($make);
                $flashMessenger = $this->_helper->FlashMessenger;
                $flashMessenger->addMessage('Make Updated Successfully');
                return $this->_helper->redirector('adminindex');
            }
            $form->submit->setLabel('Update Make');            
            $this->view->form = $form;
        } else {
            $id = $this->_getParam('id', 0);
            if ($id > 0) {
                $makeMapper = new Application_Model_MakeMapper();
                $makeRet = $makeMapper->find($id);
                $data = array(
                    'makeId' => $makeRet->getMakeId(),
                    'makeName' => $makeRet->getMakeName(),
                    'makeIcon' => $makeRet->getMakeIcon()
                );
                $form->populate($data);
                $form->submit->setLabel('Update Make');
                $this->view->form = $form;
            }
        }
    }

    public function deleteAction() {
        // action body
        $id = $this->_getParam('id', 0);

        $mapper = new Application_Model_MakeMapper();
        $result = $mapper->delete($id);
        return $this->_helper->redirector('adminindex');
    }

}

