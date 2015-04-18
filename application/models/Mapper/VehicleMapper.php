<?php

class Application_Model_Mapper_VehicleMapper {

    protected $_dbTable;

    public function setDbTable($dbTable) {
        if (is_string($dbTable)) {
            $dbTable = new $dbTable();
        }
        if (!$dbTable instanceof Zend_Db_Table_Abstract) {
            throw new Exception('Invalid table data gateway provided');
        }
        $this->_dbTable = $dbTable;
        return $this;
    }

    public function getDbTable() {
        if (null === $this->_dbTable) {
            $this->setDbTable('Application_Model_DbTable_VehiclesDb');
        }
        return $this->_dbTable;
    }
	
	
	public function findByVehicleId($id){
		$select = $this->getDbTable()->select();
		$select->where('vehicle_id = ?', $id);
		$row	=	$this->getDbTable()->fetchrow($select);
		if(0 == count($row)){
			return;
		}
		
		$var =	new Application_Model_Vehicle();
		$var->setVehicleId($row->vehicle_id);
		$var->setTrimId($row->trim_id);
		$var->setColorId($row->color_id);
		$var->setTitle($row->title);
		
		$var->setBigFront($row->front_big_img);
		$var->setBigRear($row->rear_big_img);
		$var->setBigInterior($row->interior_big_img);
		$var->setSmallFront($row->front_small_img);
		$var->setSmallRear($row->rear_small_img);
		$var->setSmallInterior($row->interior_small_img);
		
		return $var;
	}
	
	
	/*
	
	
	public function findByType( $type ){
		$select = $this->getDbTable()->select();
		$select->where('type = ?', $type);
		$resultSet	=	$this->getDbTable()->fetchAll($select);
		foreach ($resultSet as $row) {		
			$obj	=	new Application_Model_Variable();
			$obj->setVarName($row->name);
			$obj->setVarValue($row->value);
			$obj->setVarType($row->type);
			$objArr[] = $obj;
		}
		
		return $objArr;
	}
	
	
  	public function fetchAll($flag = false){
		
		$select = $this->getDbTable()->select();
		if($flag){
			$select->where(' name = "indexpage" OR name = "contactpage" OR name = "aboutpage" ');
		}else{
			$select->where('name != "indexpage" AND name != "aboutpage" AND name != "contactpage" ');
		}
		$select->order(array('name'));
		$resultSet	=	$this->getDbTable()->fetchAll($select);
		foreach ($resultSet as $row) {		
			$obj	=	new Application_Model_Variable();
			$obj->setVarName($row->name);
			$obj->setVarValue($row->value);
			$obj->setVarType($row->type);
			$objArr[] = $obj;
		}
		
		return $objArr;
    }
	
	 public function save(Application_Model_Variable $var , $flag = false) {
		
		$data = array(
            'name' 		=> $var->getVarName(),
            'value' 	=> $var->getVarValue(),
			'type'     => $var->getVarType()
        );
		
		if($flag){
			$this->getDbTable()->update($data, array('name = ?' => $var->getVarName() ));
		}else{
			$this->getDbTable()->insert($data);
		}
    }
	
	public function countAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }
    
    public function delete($name) {
		$this->getDbTable()->delete(array('name = ?' => $name));
    }
	*/

} // $

