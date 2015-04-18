<?php

class Application_Model_Mapper_YearMapper {

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
            $this->setDbTable('Application_Model_DbTable_YearDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_Year $year) {
        $data = array(
            'year' => $year->getYear(),
			'des' => $year->getDes()
        );
        if ('' == ($id = $year->getYearId())) {
            unset($data['year_id']);
            $this->getDbTable()->insert($data);
        } else {
            $this->getDbTable()->update($data, array('year_id = ?' => $id));
        }
    }

    public function findById($id) {
        $select = $this->getDbTable()->select();
        $select->where('year_id = ?', $id);
        $row = $this->getDbTable()->fetchrow($select);
        if (0 == count($row)) {
            return;
        }
        $year = new Application_Model_Year();
        $year->setYearId($row->year_id);
        $year->setYear($row->year);
		$year->setDes($row->des);
        return $year;
    }

    public function findByYear($id) {
        $select = $this->getDbTable()->select();
        $select->where('year = ?', $id);
        $row = $this->getDbTable()->fetchrow($select);
        if (0 == count($row)) {
            return;
        }
        //$row = $result->current();
        $year = new Application_Model_Year();
        $year->setYearId($row->year_id);
        $year->setYear($row->year);
        return $year;
    }

    public function fetchAll() {
        $select = $this->getDbTable()->select();
        $select->order(array('year'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $years = array();
        foreach ($resultSet as $row) {
            $year = new Application_Model_Year();
            $year->setYearId($row->year_id);
            $year->setYear($row->year);
			$year->setDes($row->des);
			
            $years[] = $year;
        }
        return $years;
    }


    public function countAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }
    
    public function delete($id) {
        $result = $this->getDbTable()->delete('year_id=' . (int) $id);
        return $result;
    }

}

