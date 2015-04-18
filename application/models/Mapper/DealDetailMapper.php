<?php

class Application_Model_Mapper_DealDetailMapper {

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
            $this->setDbTable('Application_Model_DbTable_DealDetailDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_DealDetails $dealDetail) {
		
		$data = array(
            'deal_id' => $dealDetail->getDealId(),
            'sp_first_name' => $dealDetail->getSalesPersonFirstName(),
            'sp_last_name' => $dealDetail->getSalesPersonLastName(),
            'c_first_name' => $dealDetail->getCustomerFirstName(),
            'c_last_name' => $dealDetail->getcustomerLastName(),
            'c_email' => $dealDetail->getCustomerEmail(),
            'c_phone' => $dealDetail->getCustomerPhone()
        );
        return $this->getDbTable()->insert($data);
    }

    public function fetchById($id) {
        $select = $this->getDbTable()->select();
        $select->where('deal_id = ?', $id);
        $row = $this->getDbTable()->fetchrow($select);
        if (0 == count($row)) {
            return;
        }
        //$row = $result->current();
        $dealDetail = new Application_Model_DealDetails();
        $dealDetail->setDealId($row->deal_id);
        $dealDetail->setSalesPersonFirstName($row->sp_first_name);
        $dealDetail->setSalesPersonLastName($row->sp_last_name);
        $dealDetail->setCustomerPersonFirstName($row->c_first_name);
        $dealDetail->setCustomerLastName($row->c_last_name);
        $dealDetail->setCustomerEmail($row->c_email);
        $dealDetail->setCustomerPhone($row->c_phone);
        return $dealDetail;
    }

    public function fetchAll($orderby) {
        $select = $this->getDbTable()->select();
        $select->order(array($orderby));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $dealDetails = array();

        foreach ($resultSet as $row) {

            $dealDetail = new Application_Model_DealDetails();
            $dealDetail->setDealId($row->deal_id);
            $dealDetail->setSalesPersonFirstName($row->sp_first_name);
            $dealDetail->setSalesPersonLastName($row->sp_last_name);
            $dealDetail->setCustomerPersonFirstName($row->c_first_name);
            $dealDetail->setCustomerLastName($row->c_last_name);
            $dealDetail->setCustomerEmail($row->c_email);
            $dealDetail->setCustomerPhone($row->c_phone);

            $dealDetails[] = $dealDetail;
        }

        return $dealDetails;
    }

    public function fetchDealDetailsByCustomerEmailAndUid($email, $db, $userID) {
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $select = $db->select();
        $select->from(array('dd' => 'deal_details'))
                ->join(array('d' => 'deals'), 'd.deal_id = dd.deal_id', array())
                ->where('dd.c_email = ?', $email)
                ->where('d.uid = ?', $userID);

        $stmt = $select->query();
        $resultSet = $stmt->fetchAll();

        $dealDetails = array();

        foreach ($resultSet as $row) {

            $dealDetail = new Application_Model_DealDetails();
            $dealDetail->setDealId($row->deal_id);
            $dealDetail->setSalesPersonFirstName($row->sp_first_name);
            $dealDetail->setSalesPersonLastName($row->sp_last_name);
            $dealDetail->setCustomerPersonFirstName($row->c_first_name);
            $dealDetail->setCustomerLastName($row->c_last_name);
            $dealDetail->setCustomerEmail($row->c_email);
            $dealDetail->setCustomerPhone($row->c_phone);

            $dealDetails[] = $dealDetail;
        }

        return $dealDetails;
    }
    
    public function delete($id) {
        $result = $this->getDbTable()->delete('deal_id=' . (int) $id);
        return $result;
    }

}

