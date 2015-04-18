<?php

class PresentationController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
        $this->_helper->layout()->disableLayout();
    }

    public function indexAction() {

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $userID = strtolower($identity['uid']);
        $dealerID = strtolower($identity['dealer_id']);
        if($dealerID == 0){$dealerID = $userID;}

        $dealerDefaultsMapper = new Application_Model_DealerDefaultsMapper();
        $dealerDefaultsObj = $dealerDefaultsMapper->findById($dealerID);        

        $req = $this->getRequest();

        $this->view->dealID = $req->getParam('dealID');
        $this->view->dealType = $req->getParam('dealType');
        $this->view->vehicleID = $req->getParam('vehicleID');
        $this->view->dealRef = $req->getParam('dealRef');
        $this->view->dealWork = $req->getParam('dealWork');

        $this->view->invoiceID = $req->getParam('invoiceID');
        $this->view->makeID = $req->getParam('makeID');
        $this->view->trimID = $req->getParam('trimID');
        $this->view->exteriorColorID = $req->getParam('exteriorColorID');
        $this->view->interiorColorID = $req->getParam('interiorColorID');
        $this->view->ModelName = $req->getParam('ModelName');
        $this->view->YearName = $req->getParam('YearName');
        $this->view->InteriorColor = $req->getParam('InteriorColor');

        $this->view->userID = $userID;
        $this->view->dealerID = $dealerID;

        
        
    }

}

