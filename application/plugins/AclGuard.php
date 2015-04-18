<?php

class Plugin_AclGuard extends Zend_Controller_Plugin_Abstract{
	
	private $db;
	private $acl;
	private $auth;
	private $role;
	public $roleId	=	4;  // guest
	private $supperRole 	=	'administrator';
	private $supperRoleId	=	1;
	private $pointer = 1;
	private $Is = false;
	
	
	public function __construct(){
	  $this->db = Zend_Registry::get('database');
	  $this->acl = new Zend_Acl();
	  $this->auth = Zend_Auth::getInstance();
	}


	public function preDispatch(Zend_Controller_Request_Abstract $request) {
		
		
		if($this->Is){
			
			$this->addAocRoles();
			$this->addResources();
				
			if ($this->auth->hasIdentity()) {
				$identity = $this->auth->getIdentity();
				$this->role 	= strtolower($identity['role']);
				$this->roleId 	= strtolower($identity['roleId']);
			} else {
				$this->role 	= 'guest';
			}
			
			if($this->roleId == $this->supperRoleId){
				$this->assignFullPermissions();	 
			}else{
				$this->assignPermissions();
			}
			
			
	
			$controller = $request->controller;
			$action = $request->action;
			
			 if (!$this->acl->isAllowed($this->role, $controller, $action)) {
				if ($this->role == 'guest') {			
					$urlOptions = array('controller' => 'admin', 'action' => 'index');
					$redirector = new Zend_Controller_Action_Helper_Redirector();
					$redirector->gotoRoute($urlOptions, null, true);
				} else {	
					$request->setControllerName('error');
					$request->setActionName('noauth');
				}
			}
		} // Is
		
	}
	
	
	
	/*  _Helper functions	*/
	
	private function addAocRoles(){
		$select = $this->db->select()->from("acl_roles");
		$stmt = $select->query();
		while($row = $stmt->fetchObject()){
			$this->acl->addRole(new Zend_Acl_Role($row->role_name));
		}
	}
	
	private function addResources(){
		$select = $this->db->select()->from("acl_resources");
		$stmt = $select->query();
		while($row = $stmt->fetchObject()){
			$this->acl->add(new Zend_Acl_Resource($row->resource));
		}
	}
	
	
	private function assignPermissions(){
		
		
		
		//$this->acl->allow('admin', 'main', array('index'));
		//$this->acl->allow('admin', 'admin', array('logout'));
		
		
		/*
		$select	= $this->db->fetchAll($this->db->select() 
						->from('acl_roles') 
						->from('acl_resources') 
						->from('acl_permissions') 
						->where('acl_roles.role_id = acl_permissions.role_id')); //->group('acl_roles.role_id')
		
		foreach ($select as $key => $value) { 
			$this->acl->allow($value['role_name'], $value['resource'],$value['permission']);
		} 
		
		$arr = array("add","update","delete");
		
		$str = Zend_Json::encode($arr);
		*/
		
		
		
		/*$select = $this->db->select()->from("acl_permissions")->group('role_id');
		$stmt = $select->query();
		while($row = $stmt->fetchObject()){
			echo($row->role_id);
		}*/
		
		
		$select = $this->db->select()->from("acl_permissions")->where('role_id = ?', $this->roleId);
		$stmt = $select->query();
		while($row = $stmt->fetchObject()){
			$this->applyPermissions($row->resource_id , $row->permission);
		}
	}
	
	private function assignFullPermissions(){    // this will work only for administrator
		$select = $this->db->select()->from("acl_resources");
		$stmt = $select->query();
		while($row = $stmt->fetchObject()){
			$this->applyFullPermissions($row->resource , $row->actions);
		}
	}
	
	
	private function applyPermissions($rid , $perms){
		$permArr = Zend_Json::decode($perms);
		$this->acl->allow($this->role , $this->getResourceById($rid) , $permArr );
	}
	
	private function applyFullPermissions($resource , $perms){
		$permArr = Zend_Json::decode($perms);
		$this->acl->allow($this->supperRole , $resource , $permArr );
	}
	
	private function getResourceById($rid){
		$select = $this->db->select()->from("acl_resources")->where('rid = ?', $rid);
		$stmt = $select->query();
		$row = $stmt->fetchObject();
		return $row->resource;	
	}
	
	
	private function getVariable($key){
		$select = $this->db->select()->from("variable")->where('name = ?', $key);
		$stmt = $select->query();
		$row = $stmt->fetchObject();
		return $row->value;
	}
	
	
	private function assignPublicPermissions(){
		
		$arr = Zend_Json::decode($this->getVariable('guestperm'));
		
		foreach($arr as $key => $val){
			$this->acl->allow('guest', $key , $val);
		}
		
		//$this->acl->allow('guest', 'index', array('index','aboutus','contactus'));
		//$this->acl->allow('guest', 'admin', array('index'));
	}
		
	private function getAllPermissions(){
				
		
		/*while($row = $stmt->fetchObject()){
			$this->acl->add(new Zend_Acl_Resource($row->resource));
		}*/
		
			
			//print_r($this->acl->_getRoleRegistry()->getRoles());
		/*
		if ($this->auth->hasIdentity()) {
			$identity = $this->auth->getIdentity();
			$role = strtolower($identity['password']);
			echo("Role==>".$role);
			print_r($identity);
		} else {
			echo('not');
		}
		*/
	}
}  // $ class
?>