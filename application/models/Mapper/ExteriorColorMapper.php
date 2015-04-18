<?php

class Application_Model_Mapper_ExteriorColorMapper {

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
            $this->setDbTable('Application_Model_DbTable_ExteriorColorDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_ExteriorColor $exteriorColor) {
        $data = array(
            'trim_id' => $exteriorColor->getTrimId(),
            'color_label' => $exteriorColor->getColorLabel(),
            'color_code' => $exteriorColor->getColorCode()
        );
        if ('' == ($id = $exteriorColor->getExteriorColorId())) {
            unset($data['exterior_colors_id']);
            $this->getDbTable()->insert($data);
        } else {
            $this->getDbTable()->update($data, array('exterior_colors_id = ?' => $id));
        }
    }
	
	public function fetchAll(){
		
		$select = $this->getDbTable()->select();
		$select->order(array('exterior_colors_id'));
		$resultSet = $this->getDbTable()->fetchAll($select);
        $dataArr   = array();
        foreach ($resultSet as $row) {
			$obj	=	new Application_Model_ExteriorColor();
			$obj->setExteriorColorId($row->exterior_colors_id);
			$obj->setTrimId($row->trim_id);
			$obj->setColorLabel($row->color_label);
			$obj->setColorCode($row->color_code);
		    $dataArr[] = $obj;
        }
        return $dataArr;
    }
	
	

    public function fetchByTrimId($trimId) {
        $select = $this->getDbTable()->select();
        $select->where('trim_id = ?', $trimId);
        $select->order(array('color_label'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        /* if(0 == count($row)){
          return;
          } */
        //$row = $result->current();
        $exteriorColors = array();
        foreach ($resultSet as $row) {

            $exteriorColor = new Application_Model_ExteriorColor();
            $exteriorColor->setExteriorColorId($row->exterior_colors_id);
            $exteriorColor->setTrimId($row->trim_id);
            $exteriorColor->setColorLabel($row->color_label);
            $exteriorColor->setColorCode($row->color_code);

            $exteriorColors[] = $exteriorColor;
        }
        return $exteriorColors;
    }

    public function countAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }

    public function delete($id) {
        $result = $this->getDbTable()->delete('exterior_colors_id=' . (int) $id);
        return $result;
    }

}

