<?php
class Application_Model_Mapper_InvoiceMapper
{
	protected $_dbTable;
	
	public function setDbTable($dbTable){
		if(is_string($dbTable)){
			
			$dbTable	=	new $dbTable();
		}
		if(!$dbTable instanceof Zend_Db_Table_Abstract){
			throw new Exception('Invalid table data gateway provided');	
		}
		$this->_dbTable	=	$dbTable;
		return $this;
	}
	
	public function getDbTable(){
		if(null === $this->_dbTable){
			$this->setDbTable('Application_Model_DbTable_InvoiceDb');
		}		
		return $this->_dbTable;
	}
	
	public function save(Application_Model_Invoice $invoice){
		$data	=	array(
					'id'=>$invoice->getId(),
					'invoice_id'=>$invoice->getInvoiceId(),
					'deal_id'=>$invoice->getDealId()
					);                                             
		if('' == ($id = $invoice->getId())){
			unset($data['id']);
			$this->getDbTable()->insert($data);
		}else{
			$this->getDbTable()->update($data, array('invoice_id = ?' => $id));
		}
	}
	
	
	public function fetchAllByUid( $db ,$uid) {
		$select = $db->select()->from(array('i' => 'invoices'),array('id','invoice_id','deal_id'))->join(array('d' => 'deals'),'i.deal_id = d.deal_id',array('deal_id'))->where('d.uid = ? ', $uid );
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
    }
	
	
	public function findByInvoiceId($id){
		$select	=	$this->getDbTable()->select();
		$select->where('invoice_id = ?', $id);
		$row	=	$this->getDbTable()->fetchrow($select);
		if(0 == count($row)){
			return;
		}
		$invoice	=	new Application_Model_Invoice();
		$invoice->setId($row->id);
		$invoice->setInvoiceId($row->invoice_id);
		$invoice->setDealId($row->deal_id);
		return $invoice;
	}
	
	public function findByDealId($id){
		$select = $this->getDbTable()->select();
		$select->where('deal_id = ?', $id);
		$row	=	$this->getDbTable()->fetchrow($select);
		if(0 == count($row)){
			return;
		}
		//$row = $result->current();
		$invoice	=	new Application_Model_Invoice();
		$invoice->setInvoiceId($row->invoice_id);
		$invoice->setDealId($row->deal_id);
		return $invoice;
	}

	public function fetchAll()
    {
        $select = $this->getDbTable()->select();
		$select->order(array('invoice_id'));
		$resultSet = $this->getDbTable()->fetchAll($select);
        $invoices   = array();
        foreach ($resultSet as $row) {
        
		$invoice	=	new Application_Model_Invoice();
		$invoice->setInvoiceId($row->invoice_id);
		$invoice->setDealId($row->deal_id);
		
		    $invoices[] = $invoice;
        }
        return $invoices;
    }
	
	public function delete($id)
    {
		$result	=	$this->getDbTable()->delete('invoice_id='.(int)$id);
		return $result;	
    }
}