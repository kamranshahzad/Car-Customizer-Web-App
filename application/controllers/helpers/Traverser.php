<?php


class Zend_Controller_Action_Helper_Traverser extends Zend_Controller_Action_Helper_Abstract{
	
	private $db;
	
	public function __construct(){
		$this->db = Zend_Registry::get('database');
	}
	
	public function syntaxCheck($jsonArr){
		$infoKeys = array('name','title','options','tasks');
		if($this->array_keys_exists( $jsonArr  , $infoKeys)){
			return true;
		}
		return false;
	}
	
	
	public function getInfo($targetStr , $key='name'){
		$targetArr = Zend_Json::decode($targetStr);
		return $targetArr[$key];
	}
	
	public function getOptions($jsonStr){
		$tmpArr = array(); 
		$jsonArr = Zend_Json::decode($jsonStr);
		if($this->syntaxCheck($jsonArr)){
			 $tmpArr = $jsonArr['options'];	
		}
		return $tmpArr;
	}
	
	public function isGroup( $permStr , $optionsArr ){
		$permArr = Zend_Json::decode($permStr);
		$optionsKey = array_keys($optionsArr);
		$existArr = array_intersect( $permArr, $optionsKey ); 
		if(count($existArr) > 0){
			return true;
		}
		return false;
	}
	
	public function getTasks($jsonStr){
		$tmpArr = array(); 
		$jsonArr = Zend_Json::decode($jsonStr);
		if($this->syntaxCheck($jsonArr)){
			 $tmpArr = $jsonArr['tasks'];	
		}
		return $tmpArr;
	}
	
	
	/*  _helper functions */
	public function array_keys_exists($array,$keys) {
		foreach($keys as $k) {
			if(!isset($array[$k])) {
			return false;
			}
		}
		return true;
	}
	
	public function loadPermissions( $resource , $roleId = 1 ){
		$select = '';
		$permString = '';
		if($roleId == 1){
			$select = $this->db->select()->from("acl_resources")->where('resource=?', trim($resource) );
		}else{
			$select = $this->db->select()->from(array('r' => 'acl_resources'),array('resource'))->join(array('p' => 'acl_permissions'),'r.rid = p.resource_id',array('role_id','permission'))->where('r.resource = ? ', $resource )->where('p.role_id = ? ', $roleId );
		}
		$stmt = $select->query();
		$total = $this->db->fetchOne("select FOUND_ROWS()");
		if($total > 0){
			while($row = $stmt->fetchObject()){
				if($roleId == 1){
					$permString	= $row->actions;
				}else{
					$permString	= $row->permission;
				}
			}
		}
		return $permString;
	}
	
	
	
	
	public function Debug(){
		return 'Hi, i am from Traverser...';	
	}
	
	
	
} //$
?>