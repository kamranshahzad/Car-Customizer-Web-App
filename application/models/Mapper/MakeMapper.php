<?php

class Application_Model_Mapper_MakeMapper
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
			$this->setDbTable('Application_Model_DbTable_MakeDb');
		}
		return $this->_dbTable;
	}
	
	public function save(Application_Model_Make $make){
		$data	=	array(
					'make_name'=>$make->getMakeName(),
					'make_des'=>$make->getMakeDes(),
					'make_icon'=>$make->getMakeIcon()
					);
		if('' == ($id = $make->getMakeId())){
			unset($data['make_id']);
			$this->getDbTable()->insert($data);
		}else{
			$this->getDbTable()->update($data, array('make_id = ?' => $id));
		}
	}
	
	
	public function fetchById($id){
		$select = $this->getDbTable()->select();
		$select->where('make_id = ?', $id);
		$row	=	$this->getDbTable()->fetchrow($select);
		if(0 == count($row)){
			return;
		}
		//$row = $result->current();
		$make	=	new Application_Model_Make();
		$make->setMakeId($row->make_id);
		$make->setMakeName($row->make_name);
		$make->setMakeIcon($row->make_icon);
		$make->setMakeDes($row->make_des);
		return $make;
	}
	
	public function fetchAll()
    {
        $select = $this->getDbTable()->select();
		$select->order(array('make_name'));
		$resultSet = $this->getDbTable()->fetchAll($select);
        $makes   = array();
        foreach ($resultSet as $row) {
        
		$make	=	new Application_Model_Make();
		$make->setMakeId($row->make_id);
		$make->setMakeName($row->make_name);
		$make->setMakeDes($row->make_des);
		$make->setMakeIcon($row->make_icon);
		
		    $makes[] = $make;
        }
        return $makes;
    }

    public function countAll()
    {
        $select = $this->getDbTable()->select();	
	$resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }
	
	public function delete($id)
    {
		$result	=	$this->getDbTable()->delete('make_id='.(int)$id);
		return $result;
		
    }


}  //$

