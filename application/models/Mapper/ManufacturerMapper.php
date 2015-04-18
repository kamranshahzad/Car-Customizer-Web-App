<?php

class Application_Model_Mapper_ManufacturerMapper
{
	protected $_dbTable;
	
	public function setDbTable($dbTable){
		if(is_string($dbTable)){
			$dbTable	=	new $dbTable();
		}
		if(!$dbTable instanceof Zend_Db_Table_Abstract){
			throw new Exception('Invalid table data gateway provided');	
		}
		$this->_dbTable	=	$dbTable;
		return $this;
	}
	
	
	public function getDbTable(){
		if(null === $this->_dbTable){
			$this->setDbTable('Application_Model_DbTable_ManufacturerDb');
		}
		return $this->_dbTable;
	}
	
	public function save(Application_Model_Manufacturer $obj , $db = NULL){
		$data	=	array(
					'manufacturer_name'=>$obj->getManName(),
					'notes'=>$obj->getNote(),
					'status'=>$obj->getStatus()
					);
		if('' == ($id = $obj->getManId())){
			unset($data['manufacturer_id']);
			$mid = $this->getDbTable()->insert($data);
			$std = $db->prepare("Call InsertManufacturer( ? )");
			$std->execute(array($mid));
		}else{
			$this->getDbTable()->update($data, array('manufacturer_id = ?' => $id));
		}
	}
	
	
	public function fetchById($id){
		$select = $this->getDbTable()->select();
		$select->where('manufacturer_id = ?', $id);
		$row	=	$this->getDbTable()->fetchrow($select);
		if(0 == count($row)){
			return;
		}
		//$row = $result->current();
		$obj	=	new Application_Model_Manufacturer();
		$obj->setManId($row->manufacturer_id);
		$obj->setManName($row->manufacturer_name);
		$obj->setNote($row->notes);
		$obj->setStatus($row->status);
		return $obj;
	}
	
	public function fetchAll()
    {
        $select = $this->getDbTable()->select();
		$select->order(array('manufacturer_id'));
		$resultSet = $this->getDbTable()->fetchAll($select);
        $dataArr   = array();
        foreach ($resultSet as $row) {
        
			$obj	=	new Application_Model_Manufacturer();
			$obj->setManId($row->manufacturer_id);
			$obj->setManName($row->manufacturer_name);
			$obj->setNote($row->notes);
			$obj->setStatus($row->status);
		
		    $dataArr[] = $obj;
        }
        return $dataArr;
    }
	
	
	/*
    public function countAll()
    {
        $select = $this->getDbTable()->select();	
	$resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }
	*/
	
	
	public function delete($id)
    {
		$result	=	$this->getDbTable()->delete('make_id='.(int)$id);
		return $result;
		
    }


	// Users data
	
	public function fetchAllByUserData( $db , $mid , $uid){
		$select = $db->select()->from("user_part_manufactures")->where('manufacturer_id=?', $mid )->where('uid = ?', $uid );
		$stmt 	= $select->query();
		$row 	= $stmt->fetchObject();
		return $row->notes;
	}
	
	
	public function saveUserData($db, $data , $uid , $manId ){
		$sql = "UPDATE user_part_manufactures SET notes='".$data['note']."' WHERE uid='".$uid."' AND manufacturer_id='".$manId."'";
		return $db->query($sql);	
	}
	
	
	public function statusUserData($db , $uid , $mid ){
		if($this->getStatusUserData($db , $uid , $mid)){
			$data = 0;	
		}else{
			$data = 1;	
		}
		
		$sql = "UPDATE user_part_manufactures SET status='".$data."' WHERE uid='".$uid."' AND manufacturer_id='".$mid."'";
		return $db->query($sql);	
	}
	
	public function getStatusUserData($db , $uid , $mid){
		$select = $db->select()->from("user_part_manufactures")->where('manufacturer_id=?', $mid )->where('uid = ?', $uid );
		$stmt 	= $select->query();
		$row 	= $stmt->fetchObject();
		return $row->status;
	}
	
	
}  //$

