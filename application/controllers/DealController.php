<?php

class DealController extends Zend_Controller_Action {
	
	public $dashInfoArr = array
						('name'=>'deal' ,
						'title'=>'Deal Management',
						'options'=> array			
						(
							'listdeals' => array('title'=>'Deal Management' , 'icon'=>'deals.png'),
							'listcommisions' => array('title'=>'Commisions' , 'icon'=>'exclusion.png'),
							'listorders' => array('title'=>'Orders' , 'icon'=>'orders-icon.png'),
							'listinvoice' => array('title'=>'Invoice' , 'icon'=>'invoice-icon.png')
						),
						'tasks'=> array(
							'Deals' => array('listdeals'=>'Display Deals','searchdeal'=>'Search Deals','statusdeal'=>'Enable/Disable Deals','removedeal'=>'Remove Deals'),
							'Commisions' => array( 'listcommisions' => 'Display Commsion' , 'modifycommisions'=>'Modify Deal Commisions'),
							'Orders' => array( 'listorders' => 'Display Orders' , 'modifyorder'=>'Modify Orders'),
							'Invoice' => array( 'listinvoice' => 'Display Invoices' , 'viewinvoice'=>'View Invoice')
						)
					);

				  
	private $roleId;
	private $uid;
	private $role;
	private $controllerPerms;
	private $urls;
	private $db;
	protected $_redirector = null;
	
    public function init() {
        $this->_helper->layout()->setLayout('admin_forms_layout');
		
		$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
      	$this->roleId 	= strtolower($identity['roleId']);
		$this->role 	= strtolower($identity['role']);
		$this->uid      = strtolower($identity['uid']);
		
		$this->db = Zend_Registry::get('database');
		$this->urls = new $this->_helper->urls();
		$this->_redirector = $this->_helper->getHelper('Redirector');
		
		// load current controllers permissions
		$helperObj 				= new $this->_helper->permissions();
		$this->controllerPerms	= Zend_Json::decode($helperObj->loadControllerPermissions($this->roleId , 'deal'));
		
		array_push($this->controllerPerms , 'start');
    }
	
	
	/*  _Deals   */
	public function listdealsAction(){
		
		$request = $this->getRequest(); 
		
		$this->view->headScript()->appendFile($this->urls->getBaseUrl().'js/jquery-1.4.2.min.js');
		$this->view->headLink()->appendStylesheet($this->urls->getBaseUrl().'css/tabs.css');
		$this->view->headLink()->appendStylesheet($this->urls->getBaseUrl().'css/delete.css');
		$this->view->headScript()->appendFile($this->urls->getBaseUrl().'js/custom/tabs.js');
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Deal Managements'));			 
		$this->view->addOption = $this->urls->singleLink( 'start' , $this->controllerPerms  , 'presentation/start' , 'Create New Deal' );
		$this->view->roleId = $this->roleId;
		
		$helpObj = new $this->_helper->grids();
		$form = new Application_Form_DealFindFrm();
		$mapObj = new Application_Model_Mapper_DealStatusMapper();
		
		$this->view->topWrapper       =  $helpObj->topWrapperBox("SEARCH DEALS");
		$this->view->form                   = $form;
		$form->submit->setLabel('Search Deals');
		$this->view->bottomWrapper = $helpObj->bottomWrapperBox();
		
		if ($request->isPost() && $form->isValid($request->getPost())) {
			$data = $form->getValues();  //$data['ref']
           	return $this->_helper->redirector('searchdeal');
        }
		
		
		$pendingdata  = $mapObj->fetchDealsByStatus($this->db , $this->uid , 0);
		$opendata 	  = $mapObj->fetchDealsByStatus($this->db , $this->uid , 1);
		$completedata = $mapObj->fetchDealsByStatus($this->db , $this->uid , 2);
		$finalizdata  = $mapObj->fetchDealsByStatus($this->db , $this->uid , 3);
		
		
		$this->view->pendingDeal = $helpObj->showDeals($pendingdata );
		$this->view->openDeal = $helpObj->showDeals($opendata  ,1);	
		$this->view->completeDeal = $helpObj->showDeals($completedata , 2);	
		$this->view->finalDeal = $helpObj->showDeals($finalizdata , 3);	
		
		// User Deals
		$this->view->userDeals = 'No User Deal Exists Yet';
		
		
	}
	
	public function listdealdetailsAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Deal Details'));			 
		$this->view->addOption = $this->urls->singleLink( 'start' , $this->controllerPerms  , 'presentation/start' , 'Create New Deal' );
	
		
		//$mapObj = new Application_Model_Mapper_DealMapper();
		//$data = $mapObj->fetchAllByUid($this->uid);
		//$helpObj = new $this->_helper->grids();
		
		$this->view->dealGrid = 'View Deal Details';		
	}
	
	public function viewdealaccessoriesAction(){

		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Deal Accessories'));			 
		$this->view->addOption = $this->urls->singleLink( 'start' , $this->controllerPerms  , 'presentation/start' , 'Create New Deal' );
		
		
		$deal_id = $this->getRequest()->getParam('did');

		$mapObj = new Application_Model_Mapper_DealAccessoriesMapper();
		$data = $mapObj->fetchByDealId($deal_id);
		$helpObj = new $this->_helper->grids();
		
		$this->view->dealGrid = $helpObj->showDealsAccessories($data );			
	}
	
	public function removedealaccessoriesAction(){
		
		$deal_id = $this->getRequest()->getParam('did');
		$aid = $this->getRequest()->getParam('aid');
		$mapObj = new Application_Model_Mapper_DealAccessoriesMapper();
		$mapObj->delete($aid);
		
		return $this->_helper->redirector('viewdealaccessories/did/'.$deal_id);
	}
	
	
	public function searchdealAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'deal/listdeals'=>'Deal Management','current'=>'Deals Search'));	
	}
	
	
	public function statusdealAction(){
		//base64_decode(); base64_encode
		$urlData = Zend_Json::decode(base64_decode($this->getRequest()->getParam('id')));
		$statusMap = new Application_Model_Mapper_DealStatusMapper();
		$orderMap  = new Application_Model_Mapper_OrderMapper();
		$installMap = new Application_Model_Mapper_InstallMapper();
		
		switch($urlData['type']){
			case 1:
				    $statusMap->statusUpdate(array('status'=> 1 , 'open_datetime'=>date('Y-m-d H:i:s') ) , $urlData['id'] );
					break;
			case 2:
					$statusMap->statusUpdate(array('status'=> 2 , 'complete_datetime'=>date('Y-m-d H:i:s') ) , $urlData['id'] );
					break;
			case 3:
					$statusMap->statusUpdate(array('status'=> 3 , 'finalized_datetime'=>date('Y-m-d H:i:s') ) , $urlData['id'] );
					break;
			case 4:
				    $statusMap->statusUpdate(array('status'=> 4 ) , $urlData['id'] );
					$orderMap->createNewOrder($this->db , $urlData['dealId']);
					$installMap->createNewInstall($this->db , $urlData['dealId']);
					break;;
		}
		return $this->_helper->redirector('listdeals');
	}
	
	
	public function removedealAction(){
		
		$deal_id = $this->getRequest()->getParam('did');
		$mapObj = new Application_Model_Mapper_DealMapper();
		$mapObj->delete($deal_id);
		
		return $this->_helper->redirector('listdeals');
	}
	
	
	/* _Commisions */
	
	public function listcommisionsAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Deal Commisions'));			 

		$mapObj = new Application_Model_Mapper_CommisionMapper();
		$data = $mapObj->fetchAllByUid($this->db , $this->uid);
		$helpObj = new $this->_helper->grids();
		$this->view->commisionGrid = $helpObj->showCommisionsGrid($data );
		
	}
	
	public function modifycommisionsAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'deal/listcommisions'=>'Deal Commisions','current'=>'Set Commision'));			 
		$this->view->addOption = $this->urls->singleLink( 'start' , $this->controllerPerms  , 'presentation/start' , 'Create New Deal' );
			
		$request = $this->getRequest(); 
		$cid = $this->getRequest()->getParam('id');
		$form = new Application_Form_CommisionFrm();
		$map  = new Application_Model_Mapper_CommisionMapper();
		$data = $map->fetchById($cid);
		
		$form->id->setValue($data->getId());
		$form->dealId->setValue($data->getDealId());
		$form->quntity->setValue($data->getQuntity());
		$form->type->setValue($data->getType());
		
		
		if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_Commisions($form->getValues());
			$map->save($obj);
		}
		$form->submit->setLabel('Set Commision');
		$this->view->form = $form;
	}
	
	
	/* _Orders */
   public function listordersAction(){
	   	
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'List Orders'));
	    
		$request = $this->getRequest(); 
		$helpObj = new $this->_helper->grids();
		$form    = new Application_Form_OrderFrm();
		
		if ($request->isPost() && $form->isValid($request->getPost())) {
			//return $this->_helper->redirector('displayrole');
			$this->_forward('index', 'index');
		}
		
		
		$formWrapper = $helpObj->topWrapperBox("SEARCH ORDERS");
		$formWrapper .= $form;
		$formWrapper .= $helpObj->bottomWrapperBox();
		$this->view->form = $formWrapper;
		
		
	   	$mapObj = new Application_Model_Mapper_OrderMapper();
		$data = $mapObj->fetchAllOrders($this->db , $this->uid);
		$this->view->pendingOrderGrid = $helpObj->showPednigOrdersGrd( $data );
		
		$this->view->completeOrderGrid = $helpObj->showCompleteOrderGrd();
		
		
		
   }
   
   public function modifyorderAction(){
	   	$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'deal/listorders' => 'List Orders', 'current'=>'Modify Order'));
	    
		
   }
   
   
   
   /* _Invoice */
   public function listinvoiceAction(){
	  $this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'List Invoices'));
	  
	  $mapObj = new Application_Model_Mapper_InvoiceMapper();
	  $data = $mapObj->fetchAllByUid($this->db , $this->uid);
	  $helpObj = new $this->_helper->grids();
	  $this->view->invoiceGrid = $helpObj->showInvoiceGrid($data);
	  
   }
   
   public function viewinvoiceAction(){
		// view invoice ...  
		$this->_helper->layout()->disableLayout();
		//base64_encode(Zend_Json::encode(array('invoiceId'=>$urlArr['InvoiceId'] , 'uid' => $this->uid , 'dealerId'=>$this->dealer_id , 'roleId'=> $this->roleId ))); 
		$dataArr = Zend_Json::decode(base64_decode($this->getRequest()->getParam('id')));
		
		
		$invoiceMap  = new Application_Model_Mapper_InvoiceMapper();
		$invoiceObj  = $invoiceMap->findByInvoiceId($dataArr['invoiceId']);
		$dealId      = $invoiceObj->getDealId();
		
		$dealaccMap  = new Application_Model_Mapper_DealAccessoriesMapper();
		$dealaccObj  = $dealaccMap->fetchByDealId($dealId);
		
		$partMap     = new Application_Model_Mapper_PartsMapper();
		$output = '';
		$totalAmount = 0;
		$tax         = 0;
		foreach($dealaccObj as $obj){
			 $output .= '<tr>';
          	 $output .= '<td>'.$partMap->findById($obj->getPartId())->getPartName().'</td>';
          	 $output .= '<td>'.$partMap->findById($obj->getPartId())->getPartManufacturer().'</td>';
          	 $output .= '<td>'.$partMap->findById($obj->getPartId())->getSku().'</td>';
          	 $output .= '<td align="right" nowrap="nowrap">$'.$partMap->findById($obj->getPartId())->getPartPrice().'</td>';
       		 $output .= '</tr>';
			 $totalAmount = $partMap->findById($obj->getPartId())->getPartPrice() + $totalAmount;
		}
		
		$this->view->partsList = $output;
		$this->view->tax	   = $tax;
		$this->view->totalAmount =  $totalAmount;
		$this->view->grandTotal  = $tax + $totalAmount;
   }
   
   
   

}  // $class