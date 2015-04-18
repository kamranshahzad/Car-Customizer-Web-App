<?php

class Application_Model_Mapper_DealAccessoriesMapper {

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
            $this->setDbTable('Application_Model_DbTable_DealAccesoriesDb');
        }
        return $this->_dbTable;
    }

    public function save($data, $where) {
            return $this->getDbTable()->update($data, $where);
    }
	
	
	 public function fetchByDealIdRow($deal_id) {
        $select = $this->getDbTable()->select();
        $select->where('deal_id = ?', $deal_id);
        $row = $this->getDbTable()->fetchrow($select);

        $deal = new Application_Model_DealAccessories();
        $deal->setAccessoryId($row->aid);
        $deal->setDealId($row->deal_id);
        $deal->setPartType($row->part_type);
        $deal->setPartId($row->part_id);
        $deal->setIsset($row->isset);
        $deal->setPurchase($row->purchase);
		
        return $deal;
    }
	
	public function fetchByDealId($deal_id) {
        $select = $this->getDbTable()->select();
        $select->where('deal_id = ?', $deal_id);
        $resultSet = $this->getDbTable()->fetchAll($select);
		
		$dealParts = array();
		foreach ($resultSet as $row) {
			
			$deal = new Application_Model_DealAccessories();
			$deal->setAccessoryId($row->aid);
			$deal->setDealId($row->deal_id);
			$deal->setPartType($row->part_type);
			$deal->setPartId($row->part_id);
			$deal->setIsset($row->isset);
			$deal->setPurchase($row->purchase);
			
			 $dealParts[] = $deal;
		}
        return $dealParts;
    }
	
	
	 public function delete($aid) {
        $result = $this->getDbTable()->delete('aid=' . (int) $id);
        return $result;
    }

	
	
}  //$

