<?php

class PresentationController extends Zend_Controller_Action{
	
	
	
	private $db;
	private $uid;
	private $dealer_id;
	public 	$roleId;
	public 	$role;
	public 	$controllerPerms;
	
    public function init() {     
		
		$this->db = Zend_Registry::get('database');
		
		$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
      	$this->roleId 		= strtolower($identity['roleId']);
		$this->role 		= strtolower($identity['role']);
		$this->uid      	= strtolower($identity['uid']);
		$this->dealer_id    = strtolower($identity['dealer_id']);
		
    }

    public function indexAction(){   // login
		$this->_helper->layout()->setLayout('login_layout');
		
		
		if(isset($this->uid)){
			$this->_redirect('presentation/start');
		}
		
        $request = $this->getRequest();
        $loginForm = new Application_Form_IndexLoginFrm();
        if ($this->getRequest()->isPost()) {
            if ($loginForm->isValid($request->getPost())) {

                $adapter = new Zend_Auth_Adapter_DbTable($this->db);
                $adapter->setTableName('users');
                $adapter->setIdentityColumn('uname');
                $adapter->setCredentialColumn('password');

                $adapter->setIdentity($loginForm->getValue('username'));
                $adapter->setCredential($loginForm->getValue('password'));

                $auth = Zend_Auth::getInstance();
                $result = $auth->authenticate($adapter);
                $data = array();
                $row = $adapter->getResultRowObject();

                if ($result->isValid()) {
                    $data['uid'] = $row->uid;
                    $data['dealer_id'] = $row->dealer_id;
                    $data['uname'] = $row->uname;
                    $data['email'] = $row->email;
                    $data['role'] = $row->role;

                    $auth->getStorage()->write($data);
                    if($row->role_id == 1 || $row->role_id == 2 || $row->role_id == 3 ){
                    	$this->_redirect('/admin/main');
					}else{
						$this->_redirect('/presentation/start');	
					}
                } else {
                    $this->view->loginMessage = "Sorry, your username or password was incorrect";
                    $this->view->form = $loginForm;
                }
            }
            $this->view->form = $loginForm;
        }$this->view->form = $loginForm;
	
	}
	
	public function startAction(){ // start page
		
		$infoArr = array();
		$request = $this->getRequest();
		
		$dealMap = new Application_Model_Mapper_DealMapper();
		$form = new Application_Form_DealFrm();
		$flashMessenger = $this->_helper->FlashMessenger;
		$this->view->form = $form;

		if ($this->getRequest()->isPost() && $form->isValid($request->getPost())) {
			$formData = $form->getValues();
			$infoArr['refNo'] = $formData['referenceNo'];
			$infoArr['uid']   = $this->uid;
			//if($dealMap->validateReferenceNo($infoArr['refNo'] , $infoArr['uid'] )){
				$urlData = base64_encode(Zend_Json::encode($infoArr));
				$this->_redirect('presentation/vehicle/q/'.$urlData );
			/*}else{
				$flashMessenger->addMessage('This Deal Not Exists !....');
				$this->view->errorMessage = $this->_helper->flashMessenger->getMessages();
			}*/	
        }else{ 
			$flashMessenger->addMessage('Please enter Deal Refernce no !....');
			$this->view->errorMessage = $this->_helper->flashMessenger->getMessages();	
		}
	}
	
	public function makesAction(){
		
		$makeMapObj = new Application_Model_Mapper_MakeMapper();
		$yearMapObj = new Application_Model_Mapper_YearMapper();
		
		
       	$this->view->messages = $this->_helper->flashMessenger->getMessages();
        $this->view->makes = $makeMapObj->fetchAll();
		$this->view->years = $yearMapObj->fetchAll();
	}
	
	public function modelsAction(){
		
		$params = $this->getRequest()->getParam('q');
		$urlArr = Zend_Json::decode(base64_decode($params));
		$this->view->oldUrlArr = $urlArr;
		
		$this->view->oldUrl = $params;
        $this->view->year = '2010';

        $modelMapObj = new Application_Model_Mapper_ModelMapper();
        $models = $modelMapObj->fetchByMakeIdAndYear($urlArr['makeId'] , $urlArr['yearId'] );
        $this->view->models = $models;
		
		
	}
	
	public function colorsAction(){
		
		$request = $this->getRequest();
		$params  = $this->getRequest()->getParam('q');
		$urlArr = Zend_Json::decode(base64_decode($params));
		$this->view->oldUrlArr = $urlArr;
		
		$this->view->modelOldUrl = $params;
		$extColorMap = new Application_Model_Mapper_ExteriorColorMapper();
        $this->view->exteriorColors = $extColorMap->fetchByTrimId($urlArr['trimId']);

        $intColorMap = new Application_Model_Mapper_InteriorColorMapper();
        $this->view->interiorColors = $intColorMap->fetchByTrimId($urlArr['trimId']);
		
		
		
        $form = new Application_Form_OptionFrm();
        $mapper = new Application_Model_Mapper_DealMapper();

        if ($this->getRequest()->isPost()) {
            if ($form->isValid($request->getPost())) {
				$formData = $form->getValues();
				$vehicleId = $this->getVehicleId( $formData['extcolor'] , $formData['intcolor'] , $urlArr['trimId'] );
				$invoiceId = strtoupper(uniqid() . time());
				$this->createDeal($urlArr , $formData , $vehicleId , $invoiceId);
				$this->_redirect('presentation/vehicle/q/'.$this->gotoVehicle($urlArr , $formData ,$invoiceId));
            } else{
                $this->view->form = $form;
                $this->view->dialogShow = 'true';
            }
        } else {
            $this->view->form = $form;
            $this->view->dialogShow = 'false';
        }
		
		
	} // $color
	
	public function vehicleAction(){
		
		$this->_helper->layout->disableLayout();
		$this->view->publicPath = Zend_Registry::get('publicPath');
		$urlArr = Zend_Json::decode(base64_decode($this->getRequest()->getParam('q')));
		$req = $this->getRequest();
		
		
		if(count($urlArr) == 2){
			// load saved deals
			
			$dealMap 		= new Application_Model_Mapper_DealMapper();
			$dealInvoiceMap = new Application_Model_Mapper_DealInvoiceMapper();
			$dealData	= $dealMap->fetchDealByRefNo($urlArr['refNo'] , $this->uid );
			$vehicleId 	= $dealData->getVehicleId();
			$dealId     = $dealData->getDealId();
			$dealType   = $dealData->getPaymentType();
			$extColorId = $this->getExteriorColorId($vehicleId);
			$intColorId = $this->getInteriorColorId($vehicleId);
			$trimId     = $this->getTrimId($vehicleId);
			$modelId    = $this->getModelId($vehicleId);
			$yearId     = $this->getYearId($vehicleId);
			$makeId     = $this->getMakeId($vehicleId);
			$invoiceId  = $dealInvoiceMap->fetchByDealId($dealId)->getInvoiceId();
			
			$this->view->dealID 			= $dealId;
			$this->view->dealType 			= $dealType;
			$this->view->vehicleID 			= $vehicleId;
			$this->view->dealRef 			= $urlArr['refNo'];
			$this->view->dealWork 			= 'view';
			
			$this->view->invoiceID  		 =  base64_encode(Zend_Json::encode(array('invoiceId'=>$invoiceId , 'uid' => $this->uid , 'dealerId'=>$this->dealer_id , 'roleId'=> $this->roleId )));
			$this->view->makeID    			 =  $makeId;
			$this->view->trimID     		 =  $trimId;
			$this->view->exteriorColorID 	 =  $extColorId;
			$this->view->interiorColorID  	 =  $intColorId;
			$this->view->ModelId 		     =  $modelId;
			
			$this->view->ModelName 		 	 =  $this->getModelLabel($modelId);
			$this->view->YearName 			 =  $this->getYear($yearId);
			$this->view->InteriorColor 	 	 =  $this->getInteriorColor($intColorId);
	
			$this->view->userID = $this->uid;
			$this->view->dealerID = $this->dealer_id;
			
		}else{
			// create new deal
			$this->view->dealID 			= $urlArr['DealId'];
			$this->view->dealType 			= $urlArr['DealType'];
			$this->view->vehicleID 			= $this->getVehicleId( $urlArr['ExtColor'] , $urlArr['IntColor'] , $urlArr['trimId']);
			$this->view->dealRef 			= $urlArr['RefNo'];
			$this->view->dealWork 			= 'create';
	
			$this->view->invoiceID  		 =  base64_encode(Zend_Json::encode(array('invoiceId'=>$urlArr['InvoiceId'] , 'uid' => $this->uid , 'dealerId'=>$this->dealer_id , 'roleId'=> $this->roleId ))); 
			$this->view->makeID    			 =  $urlArr['makeId'];
			$this->view->trimID     		 =  $urlArr['trimId'];
			$this->view->exteriorColorID 	 =  $urlArr['ExtColor'];
			$this->view->interiorColorID  	 =  $urlArr['IntColor'];
			$this->view->ModelId 		     =  $urlArr['modelId'];
			
			$this->view->ModelName 		 = $this->getModelLabel($urlArr['modelId']);
			$this->view->YearName 			 = '2010';
			$this->view->InteriorColor 	 = $this->getInteriorColor($urlArr['IntColor']);
	
			$this->view->userID = $this->uid;
			$this->view->dealerID = $this->dealer_id;
			
		}		
	}
	
	
	/*  _helper functions     */
   
	public function logoutAction() {
        $auth = Zend_Auth::getInstance();
        $auth->clearIdentity();
        $this->_redirect('/');
    }
	
	public function getUserRole($role_id){
		$select = $this->db->select()->from("acl_roles")->where('role_id = ?', $role_id);
		return $select->query()->fetchObject()->role_name;
	}
	
	/*  _Create Deals */
	public function gotoVehicle($oldUrls , $newData , $invoiceId ){
		$colorArr = array();
		$colorArr['InvoiceId'] = $invoiceId;
		$colorArr['ExtColor']  = $newData['extcolor'];
		$colorArr['IntColor']  = $newData['intcolor'];
		$colorArr['DealType']  = $newData['dealType'];
		$colorArr['RefNo']     = $newData['refNo'];
		$colorArr['SalFirstName'] = $newData['salesPersonFirstName'];
		$colorArr['SalLastName']  = $newData['salesPersonLastName'];
		$colorArr['CusLastName']  = $newData['customerFirstName'];
		$colorArr['CusLastName']  = $newData['customerLastName'];
		$colorArr['CusEmail'] = $newData['customerEmail'];
		$colorArr['CusPhone'] = $newData['customerPhone'];
		$url = array_merge($colorArr , $oldUrls );
		$urlStr = Zend_Json::encode($url);
		return base64_encode($urlStr);	
	}
	
	public function getVehicleId( $extColor , $intColor , $trimId ){
		$select = $this->db->select()->from(array('v' => 'vehicles'),array('vehicle_id'))->join(array('c' => 'colors'),'v.color_id = c.color_id',array('color_id'))->where('v.trim_id = ? ', $trimId )->where('c.interior_colors_id = ? ', $intColor )->where('c.exterior_colors_id = ? ', $extColor );
		return  $select->query()->fetchObject()->vehicle_id;
	}
	
	
	public function createDeal( $oldUrls , $newData , $vehicleId , $invoiceId ){
		// save all data at here ...
		$dealMap = new Application_Model_Mapper_DealMapper();
		$dealObj = new Application_Model_Deal();
		$dealObj->setDealId('');
		$dealObj->setUid($this->uid);
		$dealObj->setRefNo($newData['refNo']);
		$dealObj->setVehicleId($vehicleId);
		$dealObj->setPaymentType($newData['dealType']);
		$dealId = $dealMap->save($dealObj);
		
		$dealStatusObj = new Application_Model_DealStatus();     // done
		$dealStatusObj->setDealId($dealId);
		$dealStatusObj->setStatus(0);
		$dealStatusObj->setPendingDateTime(date('Y-m-d H:i:s'));
		$dealStatusMap = new Application_Model_Mapper_DealStatusMapper();
		$dealStatusMap->save($dealStatusObj);

		$dealDetailObj = new Application_Model_DealDetails();   // done
		$dealDetailObj->setDealId($dealId);
		$dealDetailObj->setSalesPersonFirstName($$newData['salesPersonFirstName']);
		$dealDetailObj->setSalesPersonLastName($newData['salesPersonLastName']);
		$dealDetailObj->setCustomerPersonFirstName($newData['customerFirstName']);
		$dealDetailObj->setCustomerLastName($newData['customerLastName']);
		$dealDetailObj->setCustomerEmail($newData['customerEmail']);
		$dealDetailObj->setCustomerPhone($newData['customerPhone']);
		$dealDetailMap = new Application_Model_Mapper_DealDetailMapper();
		$dealDetailMap->save($dealDetailObj);
		

		$invoice = new Application_Model_Invoice();
		$invoice->setId('');
		$invoice->setInvoiceId($invoiceId);
		$invoice->setDealId($dealId);
		$invoiceMapper = new Application_Model_Mapper_InvoiceMapper();
		$invoiceMapper->save($invoice);
		
		$commisionObj = new Application_Model_Commisions();
		$commisionObj->setDealId( $dealId );
		$commisionObj->setQuntity(0);
		$commisionObj->setType('p');
		$commMap = new Application_Model_Mapper_CommisionMapper();
		$commMap->save($commisionObj);
		
		
		
	}
	
	
	/*  _Load Deals */
	public function getExteriorColorId( $vehicleId ){
		$select = $this->db->select()->from(array('v' => 'vehicles'),array('color_id'))->join(array('c' => 'colors'),'v.color_id = c.color_id',array('exterior_colors_id'))->where('v.vehicle_id = ? ', $vehicleId );
		 return $select->query()->fetchObject()->exterior_colors_id;
	}
	
	public function getInteriorColorId( $vehicleId ){
		$select = $this->db->select()->from(array('v' => 'vehicles'),array('color_id'))->join(array('c' => 'colors'),'v.color_id = c.color_id',array('interior_colors_id'))->where('v.vehicle_id = ? ', $vehicleId );
		 return $select->query()->fetchObject()->interior_colors_id;
	}
	
	public function getColorId( $vehicleId ){
		$select = $this->db->select()->from(array('v' => 'vehicles'),array('color_id'))->join(array('c' => 'colors'),'v.color_id = c.color_id',array('exterior_colors_id'))->where('v.vehicle_id = ? ', $vehicleId );
		return $select->query()->fetchObject()->color_id;
	}
	
	public function getTrimId( $vehicleId ){
		$select = $this->db->select()->from(array('v' => 'vehicles'),array('trim_id'))->join(array('t' => 'trim'),'v.trim_id = t.trim_id',array('trim_id'))->where('v.vehicle_id = ? ', $vehicleId )->where('v.color_id = ? ', $this->getColorId($vehicleId) );
		return $select->query()->fetchObject()->trim_id;
	}
	
	public function getModelId( $vehicleId ){
		$select = $this->db->select()->from(array('v' => 'vehicles'),array('trim_id'))->join(array('t' => 'trim'),'v.trim_id = t.trim_id',array('model_id'))->where('v.vehicle_id = ? ', $vehicleId )->where('v.color_id = ? ', $this->getColorId($vehicleId) );
		return $select->query()->fetchObject()->model_id;
	}
	
	public function getYearId( $vehicleId ){
		$select = $this->db->select()->from(array('t' => 'trim'),array('model_id'))->join(array('m' => 'models'),'t.model_id = m.model_id',array('year_id'))->where('t.trim_id = ? ', $this->getTrimId($vehicleId) )->where('t.model_id = ? ', $this->getModelId($vehicleId) );
		return $select->query()->fetchObject()->year_id;
	}
	
	public function getMakeId( $vehicleId ){
		$select = $this->db->select()->from(array('t' => 'trim'),array('model_id'))->join(array('m' => 'models'),'t.model_id = m.model_id',array('make_id'))->where('t.trim_id = ? ', $this->getTrimId($vehicleId) )->where('t.model_id = ? ', $this->getModelId($vehicleId) );
		return $select->query()->fetchObject()->make_id;
	}
	
	public function getInteriorColor( $intColorId ){
		$select = $this->db->select()->from("interior_colors")->where('interior_colors_id = ?', $intColorId);
		return $select->query()->fetchObject()->color_label;
	}
	
	public function getModelLabel( $modelId ){
		$select = $this->db->select()->from("models")->where('model_id = ?', $modelId);
		return $select->query()->fetchObject()->model_name;
	}
	
	public function getYear( $yearId ){
		$select = $this->db->select()->from("years")->where('year_id = ?', $yearId);
		return $select->query()->fetchObject()->year;
	}
	

} //$

