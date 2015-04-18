<?php

class Application_Model_Mapper_DealInvoiceMapper {

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
            $this->setDbTable('Application_Model_DbTable_InvoiceDb');
        }
        return $this->_dbTable;
    }
	
	
	/*
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
	*/
	
	
    public function fetchByDealId($deal_id) {
        $select = $this->getDbTable()->select();
        $select->where('deal_id = ?', $deal_id);
        $row = $this->getDbTable()->fetchrow($select);

        $deal = new Application_Model_DealInvoice();
        $deal->setId($row->id);
        $deal->setInvoiceId($row->invoice_id);
        $deal->setDealId($row->deal_id);
        
        return $deal;
    }

   
    public function delete($id) {
        $result = $this->getDbTable()->delete('deal_id=' . (int) $id);
        return $result;
    }

}

