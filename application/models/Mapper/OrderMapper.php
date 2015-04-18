<?php

class Application_Model_Mapper_OrderMapper {

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
            $this->setDbTable('Application_Model_DbTable_OrdersDb');
        }
        return $this->_dbTable;
    }
	
	
	public function createNewOrder($db ,$dealId){
		$totalAmount = $this->getPartsAmount($db , $dealId) + $this->getWheelsAmount($db , $dealId);
		$data = array(
            'deal_id' => $dealId ,
            'total_amount' => $totalAmount ,
            'discount' => 0,
			'tax' => 0,
			'cdate' => date('Y-m-d H:i:s')
        );
        $this->getDbTable()->insert($data);
	}
	
	private function getPartsAmount( $db , $dealId ){
		$amount = 0;
		$select = $db->select()->from(array('a' => 'deal_accessories'),array('aid'))->join(array('p' => 'parts'),'a.part_id = p.part_id',array('part_price'))->where('a.deal_id = ? ', $dealId )->where('a.part_type = ? ', 'p' );
		$stmt = $select->query();
		while($row = $stmt->fetchObject()){
			$amount = $row->part_price + $amount;
		}
		return $amount;
	}
	
	private function getWheelsAmount($db , $dealId){
		$select = $db->select()->from(array('a' => 'deal_accessories'),array('aid' ))->join(array('w' => 'wheels'),'a.part_id = w.wheel_id',array('part_price'))->where('a.deal_id = ? ', $dealId )->where('a.part_type = ? ', 'w' );
		$stmt = $select->query();
		$amount = 0;
		while($row = $stmt->fetchObject()){
			$amount = $row->part_price + $amount;
		}
		return $amount;
	}
	
	
	
	public function fetchAllOrders( $db ,$uid) {
		$select = $db->select()->from(array('o' => 'orders'),array('order_id','deal_id','total_amount','discount','tax','cdate'))->join(array('d' => 'deals'),'o.deal_id = d.deal_id',array('deal_id'))->where('d.uid = ? ', $uid );
		$stmt = $select->query();
		$dataArr = array();
		while($row = $stmt->fetchObject()){
			$obj = new Application_Model_Orders();
			$obj->setOrderId($row->order_id);
			$obj->setDealId($row->deal_id);
			$obj->setTotalAmount($row->total_amount );
			$obj->setTax($row->tax);
			$obj->setDiscount($row->discount);
			$obj->setCdate($row->cdate);
			
			$dataArr[] = $obj;
	 	}
		return $dataArr;
    }
	
	/*
	public function findByKey($key){
		$select = $this->getDbTable()->select();
		$select->where('name = ?', $key);
		$row	=	$this->getDbTable()->fetchrow($select);
		if(0 == count($row)){
			return;
		}
		//$row = $result->current();
		$var	=	new Application_Model_Variable();
		$var->setVarName($row->name);
		$var->setVarValue($row->value);
		$var->setVarType($row->type);
		return $var;
	}
	
	public function findByType( $type ){
		$select = $this->getDbTable()->select();
		$select->where('type = ?', $type);
		$resultSet	=	$this->getDbTable()->fetchAll($select);
		foreach ($resultSet as $row) {		
			$obj	=	new Application_Model_Variable();
			$obj->setVarName($row->name);
			$obj->setVarValue($row->value);
			$obj->setVarType($row->type);
			$objArr[] = $obj;
		}
		
		return $objArr;
	}
	
	
  	public function fetchAll($flag = false){
		
		$select = $this->getDbTable()->select();
		if($flag){
			$select->where(' name = "indexpage" OR name = "contactpage" OR name = "aboutpage" ');
		}else{
			$select->where('name != "indexpage" AND name != "aboutpage" AND name != "contactpage" ');
		}
		$select->order(array('name'));
		$resultSet	=	$this->getDbTable()->fetchAll($select);
		foreach ($resultSet as $row) {		
			$obj	=	new Application_Model_Variable();
			$obj->setVarName($row->name);
			$obj->setVarValue($row->value);
			$obj->setVarType($row->type);
			$objArr[] = $obj;
		}
		
		return $objArr;
    }
	
	 public function save(Application_Model_Variable $var , $flag = false) {
		
		$data = array(
            'name' 		=> $var->getVarName(),
            'value' 	=> $var->getVarValue(),
			'type'     => $var->getVarType()
        );
		
		if($flag){
			$this->getDbTable()->update($data, array('name = ?' => $var->getVarName() ));
		}else{
			$this->getDbTable()->insert($data);
		}
    }
	
	public function countAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }
    
    public function delete($name) {
		$this->getDbTable()->delete(array('name = ?' => $name));
    }
	*/

} // $

