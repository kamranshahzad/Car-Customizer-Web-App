<?php

class Application_Model_Mapper_PartCategoryMapper {

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
            $this->setDbTable('Application_Model_DbTable_PartCategoryDb');
        }
        return $this->_dbTable;
    }
	
	
	
	public function fetchAll($t='p') {
        $select = $this->getDbTable()->select();
		$select->where('t = ?', $t);
        $resultSet = $this->getDbTable()->fetchAll($select);
        $data = array();
        foreach ($resultSet as $row) {
			
            $obj = new Application_Model_PartCategories();
            $obj->setCatId($row->part_category_id);
            $obj->setTypeId($row->part_type_id);
            $obj->setCatName($row->part_category_name);
            $obj->setDes($row->des);
        	$obj->setStatus($row->status);
			
            $data[] = $obj;
        }
        return $data;
    }
	
	
	
	
	/*
		_user data
	*/
	
	
	

} // $

