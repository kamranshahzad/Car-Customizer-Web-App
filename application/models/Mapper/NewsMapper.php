<?php

class Application_Model_Mapper_NewsMapper {

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
            $this->setDbTable('Application_Model_DbTable_NewsDb');
        }
        return $this->_dbTable;
    }
	
	
	 public function save(Application_Model_News $obj) {
        $data = array(
            'nid' => $obj->getNid(),
            'title' => $obj->getTitle(),
            'des' => $obj->getDes(),
			'dates' => $obj->getDate(),
			'status' => $obj->getStatus()
        );
        
        if ('' == ($id = $obj->getNid())) {
            unset($data['nid']);      
            $this->getDbTable()->insert($data);
        } else {
            $this->getDbTable()->update($data, array('nid = ?' => $id));
        }
    }
	
	
	
	public function fetchAll(){
		$select = $this->getDbTable()->select();
		$select->order(array('nid'));
		$resultSet	=	$this->getDbTable()->fetchAll($select);
		foreach ($resultSet as $row) {		
			$obj	=	new Application_Model_News();
			$obj->setNid($row->nid);
			$obj->setTitle($row->title);
			$obj->setDes($row->des);
			$obj->setDate($row->dates);
			$obj->setStatus($row->status);
			$objArr[] = $obj;
		}	
		return $objArr;
    }
	
	public function fetchById($nid){
		$select = $this->getDbTable()->select();
		$select->where('nid = ?', $nid);
		$select->order(array('nid'));

		$row = $this->getDbTable()->fetchRow($select);
		
		$obj	=	new Application_Model_News();
		$obj->setNid($row->nid);
		$obj->setTitle($row->title);
		$obj->setDes($row->des);
		$obj->setDate($row->dates);
		$obj->setStatus($row->status);
		
		return $obj;
    }
	
	public function delete($nid) {
		$this->getDbTable()->delete(array('nid = ?' => $nid));
    }
	
	
} // $

