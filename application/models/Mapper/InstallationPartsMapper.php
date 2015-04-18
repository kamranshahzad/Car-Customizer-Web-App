<?php

class Application_Model_Mapper_InstallationPartsMapper {

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
            $this->setDbTable('Application_Model_DbTable_InstallationPartsDb');
        }
        return $this->_dbTable;
    }
	
	
	public function fetchInstallationParts( $installId ){
		$select = $this->getDbTable()->select();
		$select->where('install_id = ?', $installId);
		
		$resultSet	=	$this->getDbTable()->fetchAll($select);
		foreach ($resultSet as $row) {
			
			$obj = new Application_Model_InstallationParts();
			$obj->setPid($row->pid);
			$obj->setInstallId($row->install_id);
			$obj->setPartId($row->part_id);
			$obj->setInstallerId($row->installer_id);
			$obj->setIsDone($row->isdone);
			$obj->setPTime($row->ptime);
			$obj->setPDate($row->pdate);
			
			$objArr[] = $obj;
		}
		return $objArr;
	}
	
	/*
	public function fetchInstallationParts( $db , $partId) {
		$select = $db->select()->from(array('ip' => 'installation_parts'),array('pid','install_id','part_id','installer_id','ptime','isdone','pdate' ))->join(array('p' => 'parts'),'ip.part_id = p.part_id',array('part_name'))->where('ip.part_id = ? ', $partId );
		$stmt = $select->query();
		$dataArr = array();
		while($row = $stmt->fetchObject()){
			
			$obj = new Application_Model_InstallationParts();
			$obj->setPid($row->id);
			$obj->setInstallId($row->deal_id);
			$obj->setPartId($row->quantity);
			$obj->setInstallerId($row->type);
			$obj->setIsDone($row->type);
			$obj->setPTime($row->type);
			$obj->setPDate($row->type);
			
			$dataArr[] = $obj;
	 	}
		return $dataArr;
    }
	*/
	
	
	
	
	
	
	/*
	public function findByKey($key){
		$select = $this->getDbTable()->select();
		$select->where('name = ?', $key);
		$row	=	$this->getDbTable()->fetchrow($select);
		if(0 == count($row)){
			return;
		}
		//$row = $result->current();
		$var	=	new Application_Model_Variable();
		$var->setVarName($row->name);
		$var->setVarValue($row->value);
		$var->setVarType($row->type);
		return $var;
	}
	
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

