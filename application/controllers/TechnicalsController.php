<?php

class TechnicalsController extends Zend_Controller_Action {
	
	public $dashInfoArr = array
				('name'=>'technicals' ,
				'title'=>'Technicals Department',
				'options'=> array			
				(
					'listinstalldeals' => array('title'=>'Parts Installtion Manager' , 'icon'=>'technical_icon.png')
				),
				'tasks'=> array(
					'Parts Installation' => array('listinstalldeals'=>'Display Whole Deals','listparts'=>'View Parts', 'viewpartsdetail'=>'View Parts Details' ,'installparts'=>'Install Parts','uninstallparts'=>'Un-install Parts' , 'allpendinginstalltions'=>'Display All Pending Installtion Deals ','allcompleteinstallations'=>'Display all completed Installation Deals','completeinstalldeal'=>'Complete Installation Deal','searchinstalldeals'=>'Search Installation Deal')
				)
			);			
							  				
	private	$roleId;
	private	$role;
	private $uid;
	private	$controllerPerms;
	private	$basePath;
	private $db; 
					
    public function init() {
		$this->_helper->layout()->setLayout('admin_forms_layout');
		
		$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
      	$this->roleId 	= strtolower($identity['roleId']);
		$this->role 	= strtolower($identity['role']);
		$this->uid 	= strtolower($identity['uid']);
		
		$this->basePath = Zend_Registry::get('publicPath');
		
		$this->db = Zend_Registry::get('database');
		
		// load current controllers permissions
		$helperObj 				= new $this->_helper->permissions();
		$this->controllerPerms	= Zend_Json::decode($helperObj->loadControllerPermissions($this->roleId , 'technicals')); 
    }

    public function listinstalldealsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		
		$request = $this->getRequest(); 
		$helpObj = new $this->_helper->grids();
		$mapObj = new Application_Model_Mapper_InstallMapper();
		$form    = new Application_Form_OrderFrm();
		
		$formWrapper = $helpObj->topWrapperBox("SEARCH ORDERS");
		$formWrapper .= $form;
		$formWrapper .= $helpObj->bottomWrapperBox();
		$this->view->form = $formWrapper;
		
		if ($request->isPost() && $form->isValid($request->getPost())) {
			//return $this->_helper->redirector('displayrole');
			$this->_forward('index', 'index');
		}	
		
	   	
		$pendingdata = $mapObj->fetchInstallDeals($this->db , $this->uid , 0 );
		$this->view->pendingInstallGrid = $helpObj->showPednigInstallGrd( $pendingdata ,"PENDING PARTS INSTALLATION" );
		
		
		$completedata = $mapObj->fetchInstallDeals($this->db , $this->uid , 1  );
		$this->view->completeInstallGrid = $helpObj->showPednigInstallGrd( $completedata ,"COMPLETED PARTS INSTALLATION");
	}
	
	
	public function listpartsAction(){
		
		$installId = $this->getRequest()->getParam('id'); 
		$helpObj = new $this->_helper->grids();
		$mapObj = new Application_Model_Mapper_InstallationPartsMapper();
		
		$data = $mapObj->fetchInstallationParts( $installId );
		$this->view->listpartsGrd = $helpObj->showInstallPartsGrd( $data );
	}
	
	
	public function viewpartsdetailAction(){
		// display simple info page 	
	}
	
	
	public function installpartsAction(){
		// form will come here...
	}
	
	public function uninstallpartsAction(){
		// just redirects
	}
	
	public function allpendinginstalltionsAction(){
		// display all grid
	}
	
	public function allcompleteinstallationsAction(){
		// display all grid
	}
	
	public function completeinstalldealAction(){
		//	
	}
	
	public function searchinstalldealsAction(){
		//	
	}
	
	
	
	
	
	
	

}  // $class