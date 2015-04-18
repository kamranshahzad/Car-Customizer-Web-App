<?php

/**
 * Action Helper for finding days in a month
 */
class Zend_Controller_Action_Helper_Permissions extends Zend_Controller_Action_Helper_Abstract{
	
	private $db;
	private $dashArr;
	
	
	public function __construct(){
      $this->db = Zend_Registry::get('database');
	  $this->dashArr = array(); 
	}
	
	
	
	public function addResources(){
		$select = $this->db->select()->from("acl_resources");
		$stmt = $select->query();
        while($row = $stmt->fetchObject()){
			echo($row->resource);
		}
	}
	
	
	public function allowedPermissions(){
		//	
	}
	
	
	public function loadPermissions($rid){
		$select = $this->db->select()->from("acl_permissions")->where('role_id=?',$rid);
		$stmt = $select->query();
		$total = $this->db->fetchOne("select FOUND_ROWS()");
        $permArr = array();
		if($total > 0){
			while($row = $stmt->fetchObject()){
				$permArr[$row->resource_id] = $row->permission;
			}	
		}
		return $permArr;
	}
	
	public function loadResourcePermissions(){
		$select = $this->db->select()->from("acl_resources");
		$stmt = $select->query();
        $permArr = array();
		while($row = $stmt->fetchObject()){
			$data = array( $row->resource , $row->actions );
			$permArr[$row->rid] = $data;
		}
		return $permArr;
	}
	
	public function arraySwapValue($arr){
		$tmp = array();
		foreach($arr as $val){
			$tmp[$val] = $val;
		}
		return $tmp;
	}
	
	
	public function insertPermissions($roleId , $resourceId , $permission){
		$sql = "INSERT INTO acl_permissions (role_id, resource_id , permission ) VALUES ('".$roleId."' , '".$resourceId."' ,'".$permission."')";
		$this->db->query($sql);
	}
	
	public function updatePermissions($roleId , $resourceId , $action ){
		$sql = "UPDATE acl_permissions SET permission='".$action."' WHERE role_id='".$roleId."' AND resource_id='".$resourceId."'";
		$this->db->query($sql);
	}
	
	
	public function permissionsWorker( $data , $role_id ){
		$stackArr = array();
		unset($data['submit']);
		unset($data['permissions']);
		
		$cls = new DataCls($data);
		$cls->getKeys();
		$cls->setValues();
		$data = $cls->getPreparedData();
		
		foreach($data as $key=>$val){
			$resourceId = $this->getResourceId($key);
			if($this->isPermission($role_id , $resourceId )){
				echo $key.'==>'.Zend_Json::encode($val).'<br/>';
				$this->updatePermissions( $role_id , $resourceId , Zend_Json::encode($val));	
			}else{
				$this->insertPermissions($role_id , $resourceId , Zend_Json::encode($val));
			}
			$stackArr[$resourceId] = $key;
		}
		
		
		$markedArr = array_keys($stackArr);
		$existArr   = array_keys($this->loadPermissions($role_id));
		$stackLessArr = array_diff ( $existArr , $markedArr );
		// Handle unchecked all items
		if(count($stackLessArr) > 0){
			$empty = array();
			foreach($stackLessArr as $key => $val){
				$this->updatePermissions($role_id ,  $val , Zend_Json::encode($empty));
			}
		}
		
	} // end
	
	
	public function isPermission($role_id , $rid){
		$select = $this->db->select()->from("acl_permissions")->where("role_id = ? " , $role_id )->where(" resource_id = ? " , $rid );
		$stmt = $select->query();
		return $this->db->fetchOne("select FOUND_ROWS()");
	}
	
	public function getResourceId($resource){
		$select = $this->db->select()->from("acl_resources")->where( "resource = ?" , $resource );
		$stmt = $select->query();
		$row = $stmt->fetchObject();
		return $row->rid;
	}
	
	public function getRoleDescription($rid){
		$select = $this->db->select()->from("acl_roles")->where( "role_id = ?" , $rid );
		$stmt = $select->query();
		$row = $stmt->fetchObject();
		return $row->description;
	}
	
	
	public function Debug(){
		return 'Hi, i am here...';	
	}
	
	
	public function loadControllerPermissions( $roleId , $resource ){
		
		$permString = array();
		$select = '';
		
		
		if($roleId == 1){
			$select = $this->db->select()->from("acl_resources")->where('resource=?',$resource);
		}else{
			$select = $this->db->select()->from(array('r' => 'acl_resources'),array('resource'))->join(array('p' => 'acl_permissions'),'r.rid = p.resource_id',array('role_id','permission'))->where('r.resource = ? ', $resource )->where('p.role_id = ? ', $roleId );
		}
		$stmt = $select->query();
		$total = $this->db->fetchOne("select FOUND_ROWS()");
        
		if($total > 0){
			while($row = $stmt->fetchObject()){
				if($roleId == 1){
					$permString = $row->actions;
				}else{
					$permString = $row->permission;
				}
			}	
		}
		return $permString;
	}
	
	
	
} //$


class DataCls{

	public $dataArr;
	public $rawArr;
	public $keyArr;
	
	public function __construct($_rawArr){
		$this->dataArr = array();
		$this->keyArr  = array();
		$this->rawArr  = $_rawArr;
	}

	public function getKeys(){
		foreach($this->rawArr as $key =>$val){
					$filterArr = explode('-',base64_decode($key));
					array_push($this->keyArr , $filterArr[1]);
			}
			$this->keyArr = array_unique($this->keyArr);
	}
	
	public function setValues(){
		foreach($this->rawArr as $key =>$val){
			$filterArr = explode('-',base64_decode($key));
			if (array_key_exists($filterArr[1], $this->dataArr)) {
				$this->combineRepeating($filterArr[1]  , $val );
			}else{
				$this->dataArr[$filterArr[1]] = $val;
			}			
		}
	}
	
	public function combineRepeating( $key  , $val){
		$tmpArr = array();
		$tmpArr = $this->dataArr[$key];
		$sumArr = array_merge($tmpArr , $val);
		$this->dataArr[$key] = $sumArr;
	}
	
	public function getPreparedData(){
		return $this->dataArr;
	}
	

}  //$


?>