<?php

class Application_Model_Mapper_InteriorColorMapper {

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
            $this->setDbTable('Application_Model_DbTable_InteriorColorDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_InteriorColor $interiorColor) {
        $data = array(
            'trim_id' => $interiorColor->getTrimId(),
            'color_label' => $interiorColor->getColorLabel(),
            'color_image' => $interiorColor->getColorImage()
        );
        if ('' == ($id = $interiorColor->getExteriorColorId())) {
            unset($data['interior_colors_id']);
            $this->getDbTable()->insert($data);
        } else {
            $this->getDbTable()->update($data, array('interior_colors_id = ?' => $id));
        }
    }
	
	public function fetchAll(){
		
		$select = $this->getDbTable()->select();
		$select->order(array('interior_colors_id'));
		$resultSet = $this->getDbTable()->fetchAll($select);
        $dataArr   = array();
        foreach ($resultSet as $row) {
			$obj	=	new Application_Model_InteriorColor();
			$obj->setInteriorColorId($row->interior_colors_id);
			$obj->setTrimId($row->trim_id);
			$obj->setColorLabel($row->color_label);
			$obj->setColorImage($row->color_image);
		    $dataArr[] = $obj;
        }
        return $dataArr;
    }
	
	
    public function fetchByTrimId($trimId) {
        $select = $this->getDbTable()->select();
        $select->where('trim_id = ?', $trimId);
        $select->order(array('color_label'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $interiorColors = array();
        foreach ($resultSet as $row) {

            $interiorColor = new Application_Model_InteriorColor();
            $interiorColor->setInteriorColorId($row->interior_colors_id);
            $interiorColor->setTrimId($row->trim_id);
            $interiorColor->setColorLabel($row->color_label);
            $interiorColor->setColorImage($row->color_image);

            $interiorColors[] = $interiorColor;
        }
        return $interiorColors;
    }

    public function countAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }

    public function delete($id) {
        $result = $this->getDbTable()->delete('interior_colors_id=' . (int) $id);
        return $result;
    }

}

