<?php


class Zend_Controller_Action_Helper_Prebuild extends Zend_Controller_Action_Helper_Abstract{
	
	private $db;
	private $resourceArr;
	private $aclArr;
	private $dashArr;
	
	public function __construct(){
      $this->db = Zend_Registry::get('database');
	  $this->resourceArr 	= 	array();
	  $this->aclArr			=	array();
	  $this->dashArr		=   array();
	}
	
	public function direct(){
		
		
		
		
		// rebuild resources 
		$this->rebuildPermissions();
		if($this->resourceTable() == 0){
			foreach($this->resourceArr as $val){
				$this->putResouces($val , $this->getActionsJson($val));
			}	
		}else{
			foreach($this->resourceArr as $val){
				$this->checkResources($val);
			}
		}
		// rebuild dashbaord
		$this->preBuildDashBoard();
		if($this->countDash() == 0){
			foreach($this->dashArr as $key => $val){
				$this->putDash( $key , $val );
			}	
		}else{
			foreach($this->dashArr as $key => $val){
				$this->checkDash( $key ,$val );
			}
		}
    }
	
	private function test(){
		$sql = 'INSERT INTO acl_workflow (role_id,resource_id) VALUES (1,7)';
		$this->db->query($sql);	
	}
	
	
	private function resourceTable(){
		$select = $this->db->select()->from("acl_resources");
		$stmt 	= $select->query();
		return $this->db->fetchOne("select FOUND_ROWS()");
	}
	
	private function checkResources($resource){
		$select = $this->db->select()->from("acl_resources")->where('resource=?', $resource);
		$stmt 	= $select->query();
		$allow = $this->db->fetchOne("select FOUND_ROWS()");
		if($allow){
			$this->modifyActions($resource , $this->getActionsJson($resource));	
		}else{
			$this->putResouces($resource , $this->getActionsJson($resource));
		}
	}
	
	private function putResouces(	$resource , $actions ){
		$sql = "INSERT INTO acl_resources (resource, actions ) VALUES ('".$resource."' , '".$actions."')";
		$this->db->query($sql);
	}
	
	
	
	private function modifyActions($resource , $actions){
		$sql = "UPDATE acl_resources SET actions='".$actions."' WHERE resource='".$resource."'";
		$this->db->query($sql);
	}
	 
	
	private function compareResources2Permissions(){
		//	
	}
	
	private function getActionsJson($resource){
		return Zend_Json::encode($this->aclArr['default'][$resource]);
	}
	
	
	public function rebuildPermissions(){
		$front = $this->getFrontController();
        foreach ($front->getControllerDirectory() as $module => $path) {
                foreach (scandir($path) as $file) {
                        if (strstr($file, "Controller.php") !== false) {
                                include_once $path . DIRECTORY_SEPARATOR . $file;
                                foreach (get_declared_classes() as $class) {
                                        if (is_subclass_of($class, 'Zend_Controller_Action')) {
                                                $controller = strtolower(substr($class, 0, strpos($class, "Controller")));
                                                $actions 	= array();
                                                foreach (get_class_methods($class) as $action) {
                                                        if (strstr($action, "Action") !== false) {
                                                                $actions[] = str_replace("Action" , "" , $action);  
                                                        }
                                                }
                                        }
                                }
                                $this->aclArr[$module][$controller] = $actions;
                        }
                }
        }
		$this->resourceArr = array_keys($this->aclArr['default']);
		//return  $this->aclArr;
	}
	

	
	
	/*		_Dashbaord tbl	*/

	private function countDash(){
		$select = $this->db->select()->from("acl_dashboard");
		$stmt 	= $select->query();
		return $this->db->fetchOne("select FOUND_ROWS()");
	}
	
	private function checkDash($key , $val ){
		$select = $this->db->select()->from("acl_dashboard")->where('resource=?', $key);
		$stmt 	= $select->query();
		$allow = $this->db->fetchOne("select FOUND_ROWS()");
		if($allow){
			$this->modifyDash($key , $val );	
		}else{
			$this->putDash($key , $val );
		}
	}
	
	public function putDash($resource , $details ){
		$sql = "INSERT INTO acl_dashboard (resource, details ) VALUES ('".$resource."' , '".Zend_Json::encode($details)."')";
		$this->db->query($sql);
	}
	
	
	
	private function modifyDash($resource , $details){
		$sql = "UPDATE acl_dashboard SET details='".Zend_Json::encode($details)."' WHERE resource='".$resource."'";
		$this->db->query($sql);
	}
	
	public function preBuildDashBoard(){
		$front = $this->getFrontController();
        foreach ($front->getControllerDirectory() as $module => $path) {
                foreach (scandir($path) as $file) {
                        if (strstr($file, "Controller.php") !== false) {
                                include_once $path . DIRECTORY_SEPARATOR . $file;
								$class_vars = get_class_vars($this->removeExtention($file));
								foreach ($class_vars as $name => $value) {
									if(gettype($value) == 'array'){
										 $this->dashArr[$value['name']] = $value;
									}
								}
                        }
                }
        }
	}

	public function removeExtention($strName){  
		 $ext = strrchr($strName, '.');  
	
		 if($ext !== false)  
		 {  
			 $strName = substr($strName, 0, -strlen($ext));  
		 }  
		 return $strName;  
	}  
	
}   // $ class



/* # in controller

$this->_helper->prebuild();

*/

?>

