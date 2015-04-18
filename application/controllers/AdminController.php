<?php

class AdminController extends Zend_Controller_Action {
	
	
	private $db;
	private $roleId;
	
    public function init() {
        /* Initialize action controller here */
       $this->_helper->layout()->setLayout('login_layout');
	   
	   	$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
      	$this->roleId 	= strtolower($identity['roleId']);
    }

    public function indexAction() {
		
		
		$bootstrap = $this->getFrontController()->getParam('bootstrap');
        $this->db = $bootstrap->getResource('db');
        $request = $this->getRequest();
        $loginForm = new Application_Form_LoginFrm();
		
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
                    $data['roleId'] = $row->role_id;
					$data['role']	= $this->getUserRole($row->role_id);
					$data['cp']     = $this->getCp($row->role_id);
					
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
        }
		$this->view->form = $loginForm;		
		
		
		// accessing Plugin's function inside controller
		//$obj = new Plugin_AclGuard();
		//echo $obj->getTest();
		
		
		
		
		//$obj = new $this->_helper->permissions(); 
		//$obj->preBuildDashBoard();
		
		

    }
	
	
	public function mainAction(){
		$this->_helper->layout()->setLayout('admin_forms_layout');
		$dash	= new $this->_helper->Dashboard();
		$this->view->dashboard = $dash->drawDashboard();
		
		
	}
	
	
	
	
	
	/*  _Helpers  */
	public function getUserRole($role_id){
		$select = $this->db->select()->from("acl_roles")->where('role_id = ?', $role_id);
		$stmt 	= $select->query();
        $row 	= $stmt->fetchObject();
        return $row->role_name;
	}
	
	public function getCp($role_id){
		$select = $this->db->select()->from("acl_roles")->where('role_id = ?', $role_id);
		$stmt 	= $select->query();
        $row 	= $stmt->fetchObject();
        return $row->iscp;
	}
	
	
    public function logoutAction() {
        $auth = Zend_Auth::getInstance();
        $auth->clearIdentity();
        $this->_redirect('/admin');
    }

}  // $class
?>