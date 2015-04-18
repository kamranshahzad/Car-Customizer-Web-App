<?php

class Application_Model_Mapper_ModelMapper {

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
            $this->setDbTable('Application_Model_DbTable_ModelDb');
        }
        return $this->_dbTable;
    }

    public function save(Application_Model_VModel $model) {
        $data = array(
            'make_id' => $model->getMakeId(),
            'year_id' => $model->getYearId(),
            'model_name' => $model->getModelName(),
            'model_image' => $model->getModelImage()
        );
        if ('' == ($id = $model->getModelId())) {
            unset($data['model_id']);
            $this->getDbTable()->insert($data);
        } else {
            $this->getDbTable()->update($data, array('model_id = ?' => $id));
        }
    }

    public function fetchById($modelId) {
        $select = $this->getDbTable()->select();
        $select->where('model_id = ?', $modelId);
        $select->order(array('model_name'));
        $row = $this->getDbTable()->fetchRow($select);

        $model = new Application_Model_VModel();
        $model->setModelId($row->model_id);
        $model->setMakeId($row->make_id);
        $model->setYearId($row->year_id);
        $model->setModelName($row->model_name);
        $model->setModelImage($row->model_image);
        $model->setTrims($trims);

        return $model;
    }

    public function fetchByMakeIdAndYear($makeId, $yearId) {
        $select = $this->getDbTable()->select();
        $select->where('make_id = ?', $makeId);
        $select->where('year_id = ?', $yearId);
        $select->order(array('model_name'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $models = array();
        foreach ($resultSet as $row) {

            $trim = new Application_Model_Mapper_TrimsMapper();
            $trims = $trim->fetchAllByModelId($row->model_id);

            $model = new Application_Model_VModel();
            $model->setModelId($row->model_id);
            $model->setMakeId($row->make_id);
            $model->setYearId($row->year_id);
            $model->setModelName($row->model_name);
            $model->setModelImage($row->model_image);
            $model->setTrims($trims);

            $models[] = $model;
        }
        return $models;
    }

    public function fetchAll() {
        $select = $this->getDbTable()->select();
        $select->order(array('model_name'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $models = array();
        foreach ($resultSet as $row) {

            $model = new Application_Model_VModel();
            $model->setModelId($row->model_id);
            $model->setMakeId($row->make_id);
            $model->setYearId($row->year_id);
            $model->setModelName($row->model_name);
            $model->setModelImage($row->model_image);
            $model->setTrims($trims);

            $models[] = $model;
        }
        return $models;
    }

    public function countAll() {
        $select = $this->getDbTable()->select();
        $resultSet = $this->getDbTable()->fetchAll($select);
        return count($resultSet);
    }

    public function delete($id) {
        $result = $this->getDbTable()->delete('model_id=' . (int) $id);
        return $result;
    }

}

