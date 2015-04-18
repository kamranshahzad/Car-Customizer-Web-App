<?php

class Application_Model_Mapper_DealMapper {

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
            $this->setDbTable('Application_Model_DbTable_DealsDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_Deal $deal) {
        $data = array(
            'uid' => $deal->getUid(),
            'ref_no' => $deal->getRefNo(),
            'vehicle_id' => $deal->getVehicleId(),
            'payment_type' => $deal->getPaymentType()
        );

        if ('' == ($id = $deal->getDealId())) {
            unset($data['deal_id']);
            return $this->getDbTable()->insert($data);
        } else {
            return $this->getDbTable()->update($data, array('deal_id = ?' => $id));
        }
    }

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

    public function validateReferenceNo($refNo, $uid ) {
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
	
	 public function fetchDealByStatus( $status ) {
        /*
		$select = $db->select()->from(array('ds' => 'deal_status'),array('id','deal_id','status','pending_datetime','open_datetime','complete_datetime','finalized_datetime'))->join(array('d' => 'deals'),'i.deal_id = d.deal_id',array('deal_id'))->where('d.uid = ? ', $uid );
		$stmt = $select->query();
		$dataArr = array();
		while($row = $stmt->fetchObject()){
			$obj = new Application_Model_Invoice();
			$obj->setId($row->id);
			$obj->setInvoiceId($row->invoice_id);
			$obj->setDealId($row->deal_id);
			
			$dataArr[] = $obj;
	 	}
		return $dataArr;
		*/
    }

    public function delete($id) {
        $result = $this->getDbTable()->delete('deal_id=' . (int) $id);
        return $result;
    }

}

