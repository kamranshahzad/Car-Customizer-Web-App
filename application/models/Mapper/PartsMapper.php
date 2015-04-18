<?php

class Application_Model_Mapper_PartsMapper
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
			$this->setDbTable('Application_Model_DbTable_PartsDb');
		}
		return $this->_dbTable;
	}
	
	public function save(Application_Model_Parts $part){
		$data	=	array(
					'part_id'=>$part->getPartId(),
					'vehicle_id'=>$part->getVehicleId(),
					'part_category_id'=>$part->getPartCategoryId(),
					'effected'=>$part->getEffected(),
					'part_name'=>$part->getPartName(),
					'part_manufacturer'=>$part->getPartManufacturer(),
					'description'=>$part->getDescription(),
					'sku'=>$part->getSku(),
					'status'=>$part->getStatus(),
					'part_icon'=>$part->getPartIcon(),
					'part_price'=>$part->getPartPrice(),
					'montly_price'=>$part->getMonthlyPrice(),
					'is_set'=>$part->getIsSet()
					);
                
		if('' == ($id = $part->getPartId())){
			unset($data['part_id']);
			$this->getDbTable()->insert($data);
		}else{
			 $this->getDbTable()->update($data, array('part_id = ?' => $id)); 
		}
	}
	
	
	public function findById($id){
		
		$select = $this->getDbTable()->select();
		$select->where('part_id = ?', $id);
		$row	=	$this->getDbTable()->fetchrow($select);
		if(0 == count($row)){
			return;
		}
		//$row = $result->current();
		$part	=	new Application_Model_Parts();
		$part->setPartId($row->part_id);
		$part->setVehicleId($row->vehicle_id);
		$part->setPartCategoryId($row->part_category_id);
		$part->setEffected($row->effected);
		$part->setPartName($row->part_name);
		$part->setPartManufacturer($row->part_manufacturer);
		$part->setDescription($row->description);
		$part->setSku($row->sku);
		$part->setStatus($row->status);
		$part->setPartIcon($row->part_icon);
		$part->setPartPrice($row->part_price);
		$part->setMonthlyPrice($row->montly_price);
		$part->setIsSet($row->is_set);
		
		return $part;
	}

	public function findByVehicleId($id){
		
		$select = $this->getDbTable()->select();
		$select->where('vehicle_id = ?', $id);
		$resultSet = $this->getDbTable()->fetchAll($select);
        $parts   = array();
        foreach ($resultSet as $row) {
        
		$part	=	new Application_Model_Parts();
		
		$part->setPartId($row->part_id);
		$part->setVehicleId($row->vehicle_id);
		$part->setPartCategoryId($row->part_category_id);
		$part->setEffected($row->effected);
		$part->setPartName($row->part_name);
		$part->setPartManufacturer($row->part_manufacturer);
		$part->setDescription($row->description);
		$part->setSku($row->sku);
		$part->setStatus($row->status);
		$part->setPartIcon($row->part_icon);
		$part->setPartPrice($row->part_price);
		$part->setMonthlyPrice($row->montly_price);
		$part->setIsSet($row->isset);
		
		    $parts[] = $part;
        }
        return $parts;
    }
	
	public function fetchAll()
    {
        $select = $this->getDbTable()->select();
		$select->order(array('part_id'));
		$resultSet = $this->getDbTable()->fetchAll($select);
        $parts   = array();
        foreach ($resultSet as $row) {
        
		$part	=	new Application_Model_Parts();
		
		$part->setPartId($row->part_id);
		$part->setVehicleId($row->vehicle_id);
		$part->setPartCategoryId($row->part_category_id);
		$part->setEffected($row->effected);
		$part->setPartName($row->part_name);
		$part->setPartManufacturer($row->part_manufacturer);
		$part->setDescription($row->description);
		$part->setSku($row->sku);
		$part->setStatus($row->status);
		$part->setPartIcon($row->part_icon);
		$part->setPartPrice($row->part_price);
		$part->setMonthlyPrice($row->montly_price);
		$part->setIsSet($row->isset);
		
		    $parts[] = $part;
        }
        return $parts;
    }
	
	public function delete($id)
    {
		$result	=	$this->getDbTable()->delete('part_id='.(int)$id);
		return $result;
		
    }


} //$

