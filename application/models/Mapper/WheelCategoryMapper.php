<?php

class Application_Model_Mapper_WheelCategoryMapper {

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
            $this->setDbTable('Application_Model_DbTable_WheelCategoryDb');
        }
        return $this->_dbTable;
    }
	
	
	
	public function fetchAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        $data = array();
        foreach ($resultSet as $row) {
			
            $obj = new Application_Model_WheelCategories();
            $obj->setWheelTypeId($row->wheel_type_id);
            $obj->setPartCatId($row->part_category_id);
            $obj->setWheelTypeName($row->wheel_type_name);
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

