<?php

class Application_Model_Mapper_CommisionMapper {

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
            $this->setDbTable('Application_Model_DbTable_CommisionsDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_Commisions $obj) {
        $data = array(
            'id' => $obj->getId(),
            'deal_id' => $obj->getDealId(),
            'quantity' => $obj->getQuntity(),
            'type' => $obj->getType()
        );
        if ('' == ($id = $obj->getId())) {
            unset($data['id']);
            return $this->getDbTable()->insert($data);
        } else {
            return $this->getDbTable()->update($data, array('id = ?' => $id));
        }
    }
	
	
	 public function fetchAllByUid( $db ,$uid) {
		$select = $db->select()->from(array('c' => 'commisions'),array('id','deal_id','quantity','type'))->join(array('d' => 'deals'),'c.deal_id = d.deal_id',array('deal_id'))->where('d.uid = ? ', $uid );
		$stmt = $select->query();
		$dataArr = array();
		while($row = $stmt->fetchObject()){
			$obj = new Application_Model_Commisions();
			$obj->setId($row->id);
			$obj->setDealId($row->deal_id);
			$obj->setQuntity($row->quantity);
			$obj->setType($row->type);
			
			$dataArr[] = $obj;
	 	}
		return $dataArr;
    }
	
	 public function fetchById($id) {
        $select = $this->getDbTable()->select();
        $select->where('id = ?', $id);
        $row = $this->getDbTable()->fetchrow($select);

        $obj = new Application_Model_Commisions();
		$obj->setId($row->id);
		$obj->setDealId($row->deal_id);
		$obj->setQuntity($row->quantity);
		$obj->setType($row->type);
		
		
        return $obj;
    }
	
	
	/*
	public function find($id, Application_Model_Guestbook $guestbook)
    {
        $result = $this->getDbTable()->find($id);
        if (0 == count($result)) {
            return;
        }
        $row = $result->current();
        $guestbook->setId($row->id)
                  ->setEmail($row->email)
                  ->setComment($row->comment)
                  ->setCreated($row->created);
    }
	*/
	
	/*
    public function fetchById($id) {
        $select = $this->getDbTable()->select();
        $select->where('deal_id = ?', $id);
        $row = $this->getDbTable()->fetchrow($select);

        $deal = new Application_Model_Deal();
        $deal->setDealId($row->deal_id);
        $deal->setUid($row->uid);
        $deal->setRefNo($row->ref_no);
        $deal->setVehicleId($row->vehicle_id);
        $deal->setPaymentType($row->payment_type);
        
        return $deal;
    }

    public function validateReferenceNo($refNo, $uid) {
        $valid = false;
        $select = $this->getDbTable()->select();
        $select->where('ref_no = ?', $refNo);
        $select->where('uid = ?', $uid);
        $row = $this->getDbTable()->fetchrow($select);
        if(count($row) > 0){
            $valid = true;
        }
        return $valid;
    }

    public function fetchDealByRefNo($refNo, $uid) {
        $select = $this->getDbTable()->select();
        $select->where('ref_no = ?', $refNo);
        $select->where('uid = ?', $uid);
        $row = $this->getDbTable()->fetchRow($select);
            $deal = new Application_Model_Deal();
            $deal->setDealId($row->deal_id);
            $deal->setUid($row->uid);
            $deal->setRefNo($row->ref_no);
            $deal->setVehicleId($row->vehicle_id);
            $deal->setPaymentType($row->payment_type);
        return $deal;
    }

    public function fetchAllDealsByRefNo($refNo, $uid) {
        $select = $this->getDbTable()->select();
        $select->where('ref_no = ?', $refNo);
        $select->where('uid = ?', $uid);
        $select->order(array('uid'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $deals = array();
        foreach ($resultSet as $row) {

            $deal = new Application_Model_Deal();
            $deal->setDealId($row->deal_id);
            $deal->setUid($row->uid);
            $deal->setRefNo($row->ref_no);
            $deal->setVehicleId($row->vehicle_id);
            $deal->setPaymentType($row->payment_type);
        
            $deals[] = $deal;
        }
        return $deals;
    }

    public function fetchAllDealsByUnameAndUid($uName, $uid) {
        $select = $this->getDbTable()->select();
        $select->where('uname = ?', $uName);
        $select->where('uid = ?', $uid);
        $select->order(array('uid'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $deals = array();
        foreach ($resultSet as $row) {

            $deal = new Application_Model_Deal();
            $deal->setDealId($row->deal_id);
            $deal->setUid($row->uid);
            $deal->setRefNo($row->ref_no);
            $deal->setVehicleId($row->vehicle_id);
            $deal->setPaymentType($row->payment_type);
        
            $deals[] = $deal;
        }
        return $deals;
    }


    public function fetchAllByUid($uid) {
        $select = $this->getDbTable()->select();
        $select->where('uid = ?', $uid);
        $select->order(array('uid'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $deals = array();
        foreach ($resultSet as $row) {
			
            $deal = new Application_Model_Deal();
            $deal->setDealId($row->deal_id);
            $deal->setUid($row->uid);
            $deal->setRefNo($row->ref_no);
            $deal->setVehicleId($row->vehicle_id);
            $deal->setPaymentType($row->payment_type);
        
            $deals[] = $deal;
        }
        return $deals;
    }

    public function delete($id) {
        $result = $this->getDbTable()->delete('deal_id=' . (int) $id);
        return $result;
    }
	*/
	
	
}  //$

