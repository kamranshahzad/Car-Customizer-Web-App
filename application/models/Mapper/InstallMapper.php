<?php

class Application_Model_Mapper_InstallMapper {

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
            $this->setDbTable('Application_Model_DbTable_InstallDb');
        }
        return $this->_dbTable;
    }
	
	
	public function createNewInstall( $db ,$dealId ){
		$data = array(
            'deal_id' => $dealId ,
            'complete' => 0,
			'iDate' => date('Y-m-d H:i:s')
        );
        $installId = $this->getDbTable()->insert($data);
		$this->installParts( $db , $installId , $dealId );
	}
	
	private function installParts($db , $installId , $dealId ){
		$obj = $db->prepare("call InstallParts( ? , ? )");
		$obj->execute(array($installId,$dealId));	
	}
	
	
	
	public function fetchInstallDeals( $db , $uid , $status = 0) {
		$select = $db->select()->from(array('i' => 'install'),array('install_id','complete','iDate' ))->join(array('d' => 'deals'),'i.deal_id = d.deal_id',array('deal_id'))->where('d.uid = ? ', $uid )->where('i.complete = ? ', $status );
		$stmt = $select->query();
		
		$dataArr = array();
		while($row = $stmt->fetchObject()){
			
			$obj = new Application_Model_Install();
			$obj->setInstallId($row->install_id);
			$obj->setDealId($row->deal_id);
			$obj->setComplete($row->complete);
			$obj->setIDate($row->iDate);
			
			$dataArr[] = $obj;
	 	}
		return $dataArr;
    }
	
	
	
	
	
	
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

