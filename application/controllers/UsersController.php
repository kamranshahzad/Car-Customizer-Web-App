<?php

class UsersController extends Zend_Controller_Action  {

		public $dashInfoArr = array
						('name'=>'users' ,
						'title'=>'User Management',
						'options'=> array			
						(
							'displayusers' => array('title'=>'Users' , 'icon'=>'user-icon.png'),
							'displayrole' => array('title'=>'Roles' , 'icon'=>'roles-icon.png'),
							'listpermissions' => array('title'=>'Permissions' , 'icon'=>'permissions-icon.png'),
							'listuserdefaults' => array('title'=>'Account Defaults' , 'icon'=>'user-defaults.png'),
							'listuserdetails' => array('title'=>'Account Details' , 'icon'=>'user-details.png'),
							'myaccount'	=> array('title'=>'My Account' , 'icon'=>'user-settings.png')
						),
						'tasks'=> array(     // don't put the default permissions inside it t.e dealer role base
							'Users' => array('displayusers'=>'Display Users','createuser'=>'Create Users','statususer'=>'Enable/Disable Users','modifyuser'=>'Modify User','removeuser'=>'Remove Users'),
							'Roles' => array('displayrole'=>'Display Roles','createrole'=>'Create Role' , 'modifyrole'=>'Modify Role','removerole'=>'Remove Role'),
							'Permissions' => array('listpermissions'=>'List Permissions')
						)
					);
	
	/*
		_options build dashboard
		_tasks   build permissions form
	*/
	
	public 	$roleId;
	private $uid;
	public 	$role;
	public 	$controllerPerms;
	private $db;
	private $urls;

	
    public function init() {
        $this->_helper->layout()->setLayout('admin_forms_layout');
		
		$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
      	$this->roleId 	= strtolower($identity['roleId']);
		$this->role 	= strtolower($identity['role']);
		$this->uid      = strtolower($identity['uid']);
		
		$this->db = Zend_Registry::get('database');
	    $this->urls = new $this->_helper->urls();
		
		$helperObj 				= new $this->_helper->permissions();
		$this->controllerPerms	= Zend_Json::decode($helperObj->loadControllerPermissions($this->roleId , 'users')); 
    }
	
	
	
	
	public function indexAction(){
		
	}
	
	
	// user related tasks
	public function displayusersAction(){
		
		$grdHlp = new $this->_helper->grdUsers();
		$this->view->headScript()->appendFile($this->urls->getBaseUrl().'js/jquery-1.4.2.min.js');
		$this->view->headLink()->appendStylesheet($this->urls->getBaseUrl().'css/tabs.css');
		$this->view->headLink()->appendStylesheet($this->urls->getBaseUrl().'css/delete.css');
		$this->view->headScript()->appendFile($this->urls->getBaseUrl().'js/custom/tabs.js');
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Users'));			 
		$this->view->addOption = $this->urls->singleLink( 'createuser' , $this->controllerPerms  , 'users/createuser' , 'Create New User' );
		
		$this->view->messages = $this->_helper->flashMessenger->getMessages();
		$this->view->usersGrid = $grdHlp->displayUser( $this->roleId , $this->uid );
	}
	
	public function createuserAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' ,'users/displayusers'=>'List Users', 'current'=>'Create New User'));			 
		
		$request = $this->getRequest();
		$flashMessenger = $this->_helper->FlashMessenger; 
		$mailHlp  = new $this->_helper->templates();
		$roleMap = new Application_Model_Mapper_RoleMapper();
		$mapObj = new Application_Model_Mapper_UserMapper();
		
		$form = new Application_Form_UsersFrm();
		
		$form->buildForm($roleMap->loadUserRoles($this->roleId));
		if($this->roleId == 3){
			$form->dealerId->setValue($this->uid);
		}
		
		if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_User($form->getValues());
			$response = $mapObj->save( $obj ,$this->db , $this->roleId , $this->uid );
			if($response){
				//$mailHlp->sendCreateUserMail( 'Addoncar Account Creation' , $obj );
        		$flashMessenger->addMessage('New user created successfully!....');
				$this->_helper->redirector('displayusers');
			}else{         
        		$flashMessenger->addMessage('Username already exists , please choose other!....');
			}
		}
		$this->view->messages = $this->_helper->flashMessenger->getMessages();
		$form->submit->setLabel('Create User');
        $this->view->form = $form;
		
		$form->password->setValue(rand(000000,999999));
	}
	
	public function statususerAction(){
		$uid = $this->getRequest()->getParam('uid'); 
		$mapObj = new Application_Model_Mapper_UserMapper();
		$mailHlp  = new $this->_helper->templates();
		
		$mapObj->status($uid , $mailHlp );
		
		//$flashMessenger->addMessage('status changed successfully!....');
		$this->_helper->redirector('displayusers');	
	}
	
	public function modifyuserAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'users/displayusers'=>'List Users', 'current'=>'Modify User'));			 
		$request = $this->getRequest();
		$uid = $this->getRequest()->getParam('uid'); 	
		
		$roleMap = new Application_Model_Mapper_RoleMapper();
		$userMap = new Application_Model_Mapper_UserMapper();
		$form = new Application_Form_UsersFrm();
		$form->buildForm($roleMap->loadUserRoles($this->roleId));
		$data = $userMap->fetchByUid($uid);
		
		$form->userName->setValue($data->getUserName());
		

		$form->submit->setLabel('Modify User');
        $this->view->form = $form;
		
	}
	
	public function removeuserAction(){
		$uid = $this->getRequest()->getParam('uid');
		
		$mailHlp  = new $this->_helper->templates();
		//$mailHlp->sendUserTasksMail('Addoncars : User Permonality Account Removal ',$uid , 3);
		$mapObj = new Application_Model_Mapper_UserMapper();
		$mapObj->remove($uid , $this->db);

		
		$this->_helper->redirector('displayusers');	
	}
	
	
	// roles 
	public function displayroleAction(){
	
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Display User Roles'));			 
		$this->view->addOption = $this->urls->singleLink( 'createrole' , $this->controllerPerms  , 'users/createrole' , 'Create New Role' );
		
		$grdObj = new $this->_helper->grdRoles();						 
		$this->view->roleGrid = $grdObj->showAllRoles($this->roleId ,  $this->controllerPerms );
		
	}
	
	public function createroleAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'users/displayrole'=>'List Roles','current'=>'Create Role'));
							  
							  
        $request = $this->getRequest();
        $form = new Application_Form_RoleFrm();
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_AclRoles($form->getValues());
			$mapObj = new Application_Model_Mapper_RoleMapper();
			$mapObj->save($obj);
           	return $this->_helper->redirector('displayrole');
        }
        $form->submit->setLabel('Add Role');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New role added successfully!....');
        $this->view->form = $form;
	}
	
	public function modifyroleAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'users/displayrole'=>'List Roles','current'=>'Modify Role'));
							  
		$roleId = $this->getRequest()->getParam('id'); 	
        $request = $this->getRequest();
        $form 	= new Application_Form_RoleFrm();
		$mapObj = new Application_Model_Mapper_RoleMapper();
		$data = $mapObj->fetchById($roleId);

		$form->roleId->setValue($roleId);
		$form->roleName->setValue($data->getRoleName());
		$form->description->setValue($data->getDescription());
		$form->is->setValue($data->getIs());
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_AclRoles($form->getValues());
			$mapObj->save($obj);
           	return $this->_helper->redirector('displayrole');
        }
        $form->submit->setLabel('Modify Role');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('Selected role modified successfully!....');
        $this->view->form = $form;
			
		
	}
	
	public function removeroleAction(){
	
	}
	
	
	// perm
	public function prebuildpermissionsAction(){
	
	}
	
	public function listpermissionsAction(){
		
		
		$commHlp = new $this->_helper->grdCommans();
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' ,'current'=>'Permissions'));
	
		$request = $this->getRequest();
		$roleId   = $this->getRequest()->getParam('id'); 
			
		$subFrm  = new Application_Form_RoleSubFrm();
		$form      = new Application_Form_PermissionsFrm();
		$roleMap = new Application_Model_Mapper_RoleMapper();
		
		
		if(isset($roleId)){
			$subFrm->buildForm($roleMap->fetchRolesArr( $this->roleId ));
			$subFrm->roleName->setValue($roleId);
			$subFrm->submit->setLabel('Load Permissions');
			$form->setPermissions( $this->roleId  , $roleId );
			$form->buildForm();
			$form->submit->setLabel('Save Permissions');
		}else{
			$subFrm->buildForm($roleMap->fetchRolesArr( $this->roleId ));
			$subFrm->submit->setLabel('Load Permissions');
		}
			
		
		if ($request->isPost()) {
				 if($request->getPost('subrole')) {
						$this->_helper->redirector->gotoSimple('listpermissions','users',null,array('id' => $request->getPost('roleName') ));
				 }
				 if($request->getPost('permissions')) {
				 		$data =  $request->getPost();
				 		$perMap = new Application_Model_Mapper_PermissionsMapper();
						$perMap->save($data , $this->_helper->permissions , $roleId );
						$this->_helper->redirector->gotoSimple('listpermissions','users',null,array('id' => $roleId ));
				 }
		}
		
		$this->view->topWrapper1   =  $commHlp->topWrapperBox("USER ROLES");
		$this->view->subform = $subFrm;
		$this->view->bottomWrapper1 = $commHlp->bottomWrapperBox();
		
		$this->view->topWrapper2   =  $commHlp->topWrapperBox("ROLE PERMISSIONS");
        $this->view->form = $form;
		$this->view->bottomWrapper2 = $commHlp->bottomWrapperBox();
	}
	
	
	//# User Defaults
	public function listuserdefaultsAction(){
		
		$commHlp = new $this->_helper->grdCommans();
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard'  ,'current'=>'User Defaults'));
		
		$request = $this->getRequest();
			
		$form  = new Application_Form_UserDetailFrm();
		if ($request->isPost() && $form->isValid($request->getPost())) {
			
		}
		
		$this->view->topWrapper   =  $commHlp->topWrapperBox("USER INFORMATION(DEALER DETAILS)");
		$this->view->form = $form;
		$this->view->bottomWrapper = $commHlp->bottomWrapperBox();	
	}
	
	public function listuserdetailsAction(){
		
		$commHlp = new $this->_helper->grdCommans();
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard'  ,'current'=>'User Details'));
		
		$request = $this->getRequest();
			
		$form  = new Application_Form_UserDetailFrm();
		if ($request->isPost() && $form->isValid($request->getPost())) {
			
		}
		
		$this->view->topWrapper   =  $commHlp->topWrapperBox("USER INFORMATION(DEALER DETAILS)");
		$this->view->form = $form;
		$this->view->bottomWrapper = $commHlp->bottomWrapperBox();
		
	}
	
	
	
	
	 
	
	
	// different
	public function logoutuserAction(){
	
	}
	
	public function myaccountAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$form = new Application_Form_MyAccountFrm();
		
		$form->submit->setLabel('Save My Account');
        $this->view->form = $form;
	}
	
	
	
	/*	_Helper functions*/
	
	
	
}   // $ class