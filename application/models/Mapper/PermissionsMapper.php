<?php

class Application_Model_Mapper_PermissionsMapper {

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
            $this->setDbTable('Application_Model_DbTable_PermissionsDb');
        }
        return $this->_dbTable;
    }
	
	
	
	public function save($data , $permObj  , $role_id){
		$permObj->permissionsWorker( $data ,$role_id );
	}
	
	
	
	
	
	
	/*
    public function save(Application_Model_Trim $trim) {
        $data = array(
            'model_id' => $trim->getModelId(),
            'trim_name' => $trim->getTrimName()
        );
        if ('' == ($id = $trim->getTrimId())) {
            unset($data['trim_id']);
            $this->getDbTable()->insert($data);
        } else {
            $this->getDbTable()->update($data, array('trim_id = ?' => $id));
        }
    }

    public function fetchAllByModelId($modelId) {
        $select = $this->getDbTable()->select();
        $select->where('model_id = ?', $modelId);
        $select->order(array('trim_name'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $trims = array();
        foreach ($resultSet as $row) {				
            $trim = new Application_Model_Trim();
            $trim->setTrimId($row->trim_id);
            $trim->setModelId($row->model_id);
            $trim->setTrimName($row->trim_name);
			
				$exteriorColor = new Application_Model_ExteriorColorMapper();
       	 		$exteriorColors = $exteriorColor->fetchByTrimId($trim->getTrimId());

				$interiorColor = new Application_Model_InteriorColorMapper();
       	 		$interiorColors = $interiorColor->fetchByTrimId($trim->getTrimId());
				
				if((count($exteriorColors) > 0) and (count($interiorColors) > 0)){
            	$trims[] = $trim;
				}
        }
        return $trims;
    }

    public function fetchAllByModelIdAndYearId($modelId, $yearId) {
        $select = $this->getDbTable()->select();
        $select->where('model_id = ?', $modelId);
        $select->where('year_id = ?', $yearId);
        $select->order(array('trim_name'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $trims = array();
        foreach ($resultSet as $row) {

            $trim = new Application_Model_Trim();
            $trim->setTrimId($row->trim_id);
            $trim->setModelId($row->model_id);
            $trim->setTrimName($row->trim_name);

            $trims[] = $trim;
        }
        return $trims;
    }

    public function countAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }

    public function delete($id) {
        $result = $this->getDbTable()->delete('trim_id=' . (int) $id);
        return $result;
    }
	*/
	

}  // $

