<?php

class ColorController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        $sess_make = new Zend_Session_Namespace('make');
        $sess_year = new Zend_Session_Namespace('year');


        $sess_trim = new Zend_Session_Namespace('trim');
        $sess_model = new Zend_Session_Namespace('modelName');

        $req = $this->getRequest();
        $trimid = $req->getParam('trimid');
        $sess_trim->trimId = $trimid;

        $trimName = $req->getParam('trimName');
        $sess_trim->trimName = $trimName;

        $modelName = $req->getParam('modelName');
        $sess_model->modelName = $modelName;


        $this->view->makeId = $sess_make->makeId;
        $this->view->yearId = $sess_year->yearId;
        $this->view->year = $sess_year->year;
        $this->view->trimName = $sess_trim->trimName;
        $this->view->modelName = $sess_model->modelName;

        $exteriorColor = new Application_Model_ExteriorColorMapper();
        $this->view->exteriorColors = $exteriorColor->fetchByTrimId($sess_trim->trimId);

        $interiorColor = new Application_Model_InteriorColorMapper();
        $this->view->interiorColors = $interiorColor->fetchByTrimId($sess_trim->trimId);

        $request = $this->getRequest();
        $form = new Application_Form_Option();

        $mapper = new Application_Model_DealMapper();

        if ($this->getRequest()->isPost()) {
            if ($form->isValid($request->getPost())) {
                $auth = Zend_Auth::getInstance();
                $identity = $auth->getIdentity();
                $userId = strtolower($identity['uid']);
                $uName = strtolower($identity['uname']);
                $dealerID = strtolower($identity['dealer_id']);
                if ($dealerID == 0) {
                    $dealerID = $userId;
                }


                $validReferenceNo = $mapper->validateReferenceNo($request->getParam('refNo'), $dealerID);

                if ($validReferenceNo) {
                    $refNo = $form->getValue('refNo');
                    $dealType = $form->getValue('dealType');
                    $salesPersonFirstName = $form->getValue('salesPersonFirstName');
                    $salesPersonLastName = $form->getValue('salesPersonLastName');
                    $customerFirstName = $form->getValue('customerFirstName');
                    $customerLastName = $form->getValue('customerLastName');
                    $customerEmail = $form->getValue('customerEmail');
                    $customerPhone = $form->getValue('customerPhone');
                    $extcolor = $form->getValue('extcolor');
                    $intcolor = $form->getValue('intcolor');


                    $db = $this->getFrontController()->getParam('bootstrap')->getResource('db');

                    //SELECT *  FROM vehicles INNER JOIN colors ON vehicles.color_id  = colors.color_id WHERE vehicles.trim_id ='1' AND colors.exterior_colors_id='5' AND colors.interior_colors_id='1' GROUP BY vehicles.vehicle_id;

                    $select = $db->select();
                    $select->from('vehicles', array('vehicle_id'));
                    $select->joinUsing('colors', 'color_id', array());
                    $select->where('trim_id = ?', $trimid);
                    $select->where('interior_colors_id = ?', $intcolor);
                    $select->where('exterior_colors_id = ?', $extcolor);

                    $stmt = $select->query();
                    $row = $stmt->fetchObject();
                    $vehicleId = $row->vehicle_id;

                    if ($vehicleId != '') {
                        $select = $db->select();
                        $select->from('interior_colors', array('color_label'));
                        $select->where('interior_colors_id = ?', $intcolor);

                        $stmt = $select->query();
                        $row = $stmt->fetchObject();
                        $interiorColorLabel = $row->color_label;

                        $deal = new Application_Model_Deal();
                        $deal->setDealId('');
                        $deal->setUid($dealerID);
                        $deal->setRefNo($refNo);
                        $deal->setVehicleId($vehicleId);
                        $deal->setPaymentType($dealType);

                        $dealId = $mapper->save($deal);

                        $dealerDefaults = new Application_Model_DealerDefaultsMapper();
                        $dealerDefaultsObj = $dealerDefaults->findById($dealerID);
                        $defaultDealCommission = $dealerDefaultsObj->getDefaultDealCommission();

                        $dealCommissionMapper = new Application_Model_DealCommissionMapper();
                        $dc = new Application_Model_DealCommission();
                        $dc->setId('');
                        $dc->setDealId($dealId);
                        $dc->getCommission($defaultDealCommission);
                        $dealCommissionMapper->save($dc);

                        $dealStatusObj = new Application_Model_DealStatus();
                        $dealStatusObj->setDealId($dealId);
                        $dealStatusObj->setStatus(0);
                        $dealStatusObj->setPendingDateTime(date('Y-m-d H:i:s'));
                        $dealStatusMapper = new Application_Model_DealStatusMapper();
                        $dealStatusMapper->save($dealStatusObj);

                        $dealDetail = new Application_Model_DealDetail();
                        $dealDetail->setDealId($dealId);
                        $dealDetail->setSalesPersonFirstName($salesPersonFirstName);
                        $dealDetail->setSalesPersonLastName($salesPersonLastName);
                        $dealDetail->setCustomerPersonFirstName($customerFirstName);
                        $dealDetail->setCustomerLastName($customerLastName);
                        $dealDetail->setCustomerEmail($customerEmail);
                        $dealDetail->setCustomerPhone($customerPhone);

                        $ddmapper = new Application_Model_DealDetailMapper();
                        $ddmapper->save($dealDetail);


                        $invoiceId = strtoupper(uniqid() . time());
                        $invoice = new Application_Model_Invoice();
                        $invoice->setId('');
                        $invoice->setInvoiceId($invoiceId);
                        $invoice->setDealId($dealId);
                        $invoiceMapper = new Application_Model_InvoiceMapper();
                        $invoiceMapper->save($invoice);


                        /*                         * ************************************************************************************************* */
                        /*    Deal Finance Info		 */
                        /*                         * ************************************************************************************************* */

                        $defaultFinanceAmount = $dealerDefaultsObj->getDefaultFinanceAmount();
                        $taxRate = $dealerDefaultsObj->getTaxRate();
                        $terms = $dealerDefaultsObj->getTerms();
                        $apr = $dealerDefaultsObj->getApr();
                        $displayAmountFinanced = $dealerDefaultsObj->getDisplayAmountFinanced();
                        $displayMonthlyPayment = $dealerDefaultsObj->getDisplayMonthlyPayment();

                        $dealFinanceMapper = new Application_Model_DealFinanceMapper();
                        $df = new Application_Model_DealFinance();
                        $df->setId('');
                        $df->setDealId($dealId);
                        $df->setBank('');
                        $df->setTaxRate($taxRate);
                        $df->setFinanceType('loan');
                        $df->setDisplayAmountFinanced($displayAmountFinanced);
                        $df->setDisplayMonthlyPayment($displayMonthlyPayment);
                        $df->setTotalAmountFinanced($defaultFinanceAmount);
                        $df->setTerms($terms);
                        $df->setApr($apr);
                        $df->setMsrp('');
                        $df->setNetCapCost('');
                        $df->setResidualPercentage('');
                        $df->setResidualAmount('');
                        $df->setMoneyFactor('');
                        $df->setfinancingCap('');

                        $dealFinanceMapper->save($df);



                        $this->_redirect('/presentation/index/dealID/' . $dealId . '/invoiceID/' . $invoiceId . '/vehicleID/' . $vehicleId . '/dealRef/' . $refNo . '/dealWork/create/dealType/' . $dealType . '/makeID/' . $sess_make->makeId . '/YearName/' . $sess_year->year . '/trimID/' . $sess_trim->trimId . '/ModelName/' . $sess_model->modelName . '/exteriorColorID/' . $extcolor . '/interiorColorID/' . $intcolor . '/InteriorColor/' . $interiorColorLabel);
                    } else {
                        $this->view->vehicleMessage = 'Vehicle can\'t be shown at the moment.<br/>Vehicle with this configuration is not added in the system';
                        $this->view->form = $form;
                        $this->view->dialogShow = 'false';
                    }
                } else {
                    $this->view->refNoMessage = 'Reference Number already Exist';
                    $this->view->form = $form;
                    $this->view->dialogShow = 'true';
                }
            } else {

                $this->view->form = $form;
                $this->view->dialogShow = 'true';
            }
        } else {
            $this->view->form = $form;
            $this->view->dialogShow = 'false';
        }
    }

}
