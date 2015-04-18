<?php

class Application_Model_Mapper_DealStatusMapper{

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
            $this->setDbTable('Application_Model_DbTable_DealStatusDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_DealStatus $dealStatus) {
        $data = array(
            'id' => $dealStatus->getId(),
            'deal_id' => $dealStatus->getDealId(),
            'status' => $dealStatus->getStatus(),
            'pending_datetime' => $dealStatus->getPendingDateTime(),
            'open_datetime' => $dealStatus->getOpenDateTime(),
            'complete_datetime' => $dealStatus->getCompleteDateTime(),
            'finalized_datetime' => $dealStatus->getFinalizedDateTime()
        );

        if ('' == ($id = $dealStatus->getId())) {
            unset($data['id']);
            return $this->getDbTable()->insert($data);
            print_r($data);
            exit;
        } else {
            return $this->getDbTable()->update($data, array('id = ?' => $id));
        }
    }
	

    public function statusUpdate($data, $id) {
        $this->getDbTable()->update($data, array('id = ?' => $id));
    }

    public function fetchByDealId($dealId) {
        $select = $this->getDbTable()->select();
        $select->where('deal_id = ?', $dealId);
        $row = $this->getDbTable()->fetchrow($select);

        $dealStatus = new Application_Model_DealStatus();
        $dealStatus->setId($row->id);
        $dealStatus->setDealId($row->deal_id);
        $dealStatus->setStatus($row->status);
        $dealStatus->setPendingDateTime($row->pending_datetime);
        $dealStatus->setOpenDateTime($row->open_datetime);
        $dealStatus->setCompleteDateTime($row->complete_datetime);
        $dealStatus->setFinalizedDateTime($row->finalized_datetime);

        return $dealStatus;
    }

    public function fetchAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        $dealStatusArray = array();
        foreach ($resultSet as $row) {

            $dealStatus = new Application_Model_DealStatus();
            $dealStatus->setId($row->id);
            $dealStatus->setDealId($row->deal_id);
            $dealStatus->setStatus($row->status);
            $dealStatus->setPendingDateTime($row->pending_datetime);
            $dealStatus->setOpenDateTime($row->open_datetime);
            $dealStatus->setCompleteDateTime($row->complete_datetime);
            $dealStatus->setFinalizedDateTime($row->finalized_datetime);

            $dealStatusArray[] = $dealStatus;
        }
        return $dealStatusArray;
    }
	
	
	 public function fetchDealsByStatus( $db , $uid , $status) {
        $select = $db->select()->from(array('ds' => 'deal_status'),array('id','deal_id','status','pending_datetime','open_datetime','complete_datetime','finalized_datetime'))->join(array('d' => 'deals'),'ds.deal_id = d.deal_id',array('deal_id'))->where('d.uid = ? ', $uid )->where('ds.status = ? ', $status );
		$stmt = $select->query();
		$dataArr = array();
		while($row = $stmt->fetchObject()){
			
			$obj = new Application_Model_DealStatus();
            $obj->setId($row->id);
            $obj->setDealId($row->deal_id);
            $obj->setStatus($row->status);
            $obj->setPendingDateTime($row->pending_datetime);
            $obj->setOpenDateTime($row->open_datetime);
            $obj->setCompleteDateTime($row->complete_datetime);
            $obj->setFinalizedDateTime($row->finalized_datetime);
			
			$dataArr[] = $obj;
	 	}
		return $dataArr;
    }



    public function fetchRecentPendingDeals($db, $userID) {
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $select = $db->select();
        $select->from(array('ds' => 'deal_status'))
                ->join(array('d' => 'deals'), 'd.deal_id = ds.deal_id', array())
                ->where('ds.status = ?', 0)
                ->where('d.uid = ?', $userID)
                ->limit(5, 0);

        $stmt = $select->query();
        $resultSet = $stmt->fetchAll();
        $dealStatusArray = array();
        foreach ($resultSet as $row) {
            $dealStatus = new Application_Model_DealStatus();
            $dealStatus->setId($row->id);
            $dealStatus->setDealId($row->deal_id);
            $dealStatus->setStatus($row->status);
            $dealStatus->setPendingDateTime($row->pending_datetime);
            $dealStatus->setOpenDateTime($row->open_datetime);
            $dealStatus->setCompleteDateTime($row->complete_datetime);
            $dealStatus->setFinalizedDateTime($row->finalized_datetime);

            $dealStatusArray[] = $dealStatus;
        }
        return $dealStatusArray;
    }

    public function fetchRecentOpenDeals($db, $userID) {
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $select = $db->select();
        $select->from(array('ds' => 'deal_status'))
                ->join(array('d' => 'deals'), 'd.deal_id = ds.deal_id', array())
                ->where('ds.status = ?', 1)
                ->where('d.uid = ?', $userID)
                ->limit(5, 0);

        $stmt = $select->query();
        $resultSet = $stmt->fetchAll();
        $dealStatusArray = array();
        foreach ($resultSet as $row) {

            $dealStatus = new Application_Model_DealStatus();
            $dealStatus->setId($row->id);
            $dealStatus->setDealId($row->deal_id);
            $dealStatus->setStatus($row->status);
            $dealStatus->setPendingDateTime($row->pending_datetime);
            $dealStatus->setOpenDateTime($row->open_datetime);
            $dealStatus->setCompleteDateTime($row->complete_datetime);
            $dealStatus->setFinalizedDateTime($row->finalized_datetime);

            $dealStatusArray[] = $dealStatus;
        }
        return $dealStatusArray;
    }

    public function fetchCompletedDeals($db, $userID) {
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $select = $db->select();
        $select->from(array('ds' => 'deal_status'))
                ->join(array('d' => 'deals'), 'd.deal_id = ds.deal_id', array())
                ->where('ds.status = ?', 2)
                ->where('d.uid = ?', $userID);
                //->limit(5, 0);

        $stmt = $select->query();
        $resultSet = $stmt->fetchAll();
        $dealStatusArray = array();
        foreach ($resultSet as $row) {

            $dealStatus = new Application_Model_DealStatus();
            $dealStatus->setId($row->id);
            $dealStatus->setDealId($row->deal_id);
            $dealStatus->setStatus($row->status);
            $dealStatus->setPendingDateTime($row->pending_datetime);
            $dealStatus->setOpenDateTime($row->open_datetime);
            $dealStatus->setCompleteDateTime($row->complete_datetime);
            $dealStatus->setFinalizedDateTime($row->finalized_datetime);

            $dealStatusArray[] = $dealStatus;
        }
        return $dealStatusArray;
    }



    public function delete($id) {
        $result = $this->getDbTable()->delete('id=' . (int) $id);
        return $result;
    }

}

