<?php

class Application_Model_Mapper_BackgroundsMapper {

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
            $this->setDbTable('Application_Model_DbTable_BackgroundDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_Background $bg) {
        $data = array(
            'background_id' => $bg->getBgId(),
            'bg_name' => $bg->getBgName(),
            'bg_image' => $bg->getBgImage()
        );
        
        if ('' == ($id = $bg->getBgId())) {
            unset($data['background_id']);
                        
            $this->getDbTable()->insert($data);
        } else {
            $this->getDbTable()->update($data, array('background_id = ?' => $id));
        }
    }

    public function findById($id) {
        $select = $this->getDbTable()->select();
        $select->where('background_id = ?', $id);
        $row = $this->getDbTable()->fetchrow($select);
        if (0 == count($row)) {
            return;
        }
        //$row = $result->current();
        $bg = new Application_Model_Background();
        $bg->setBgId($row->background_id);
        $bg->setBgName($row->bg_name);
        $bg->setBgImage($row->bg_image);
		$bg->setStatus($row->status);
        return $bg;
    }

    public function fetchAll() { 
        $select = $this->getDbTable()->select();
        $select->order(array('bg_name'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $bgs = array();
        foreach ($resultSet as $row) {
            $bg = new Application_Model_Background();
            $bg->setBgId($row->background_id);
            $bg->setBgName($row->bg_name);
            $bg->setBgImage($row->bg_image);
			$bg->setStatus($row->status);
            $bgs[] = $bg;
        }
        return $bgs;
    }

    public function countAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }

    public function delete($id) {
        $result = $this->getDbTable()->delete('background_id=' . (int) $id);
        return $result;
    }

}