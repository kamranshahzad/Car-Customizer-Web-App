<?php

class Application_Model_Mapper_PartTypeMapper {

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
            $this->setDbTable('Application_Model_DbTable_PartTypeDb');
        }
        return $this->_dbTable;
    }
	
	
	public function fetchAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        $data = array();
        foreach ($resultSet as $row) {
			
            $obj = new Application_Model_PartTypes();
            $obj->setTypeId($row->part_type_id);
            $obj->setTypeName($row->part_type_name);
            $obj->setDes($row->des);
            $obj->setStatus($row->status);
        
            $data[] = $obj;
        }
        return $data;
    }
	
	 public function fetchById($type_id) {
        $select = $this->getDbTable()->select();
        $select->where('part_type_id = ?', $type_id);
        $row = $this->getDbTable()->fetchrow($select);

        $obj = new Application_Model_PartTypes();
        $obj->setTypeId($row->part_type_id);
        $obj->setTypeName($row->part_type_name);
        $obj->setDes($row->des);
        $obj->setStatus($row->status);
        
        return $obj;
    }
	
	
	
	
	/*
		_user data
	*/
	
	
	

} // $

