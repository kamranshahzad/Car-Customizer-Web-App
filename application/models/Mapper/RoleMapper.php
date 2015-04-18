<?php

class Application_Model_Mapper_RoleMapper {

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
            $this->setDbTable('Application_Model_DbTable_RoleDb');
        }
        return $this->_dbTable;
    }
	
	
	public function fetchAll($roleId){
		
		$select = '';
		$objArr	=	array();
		
		
		switch($roleId){
			case 1:
				$select = $this->getDbTable()->select();
				$select->order(array('role_id'));
				break;
			case 2:
				$select = $this->getDbTable()->select();
				$select->order(array('role_id'));
				$select->where('role_id != ? ', 1);
				$select->where('role_id != ? ', 2);
				break;
			case 3:
				$select = $this->getDbTable()->select();
				$select->order(array('role_id'));
				$select->where('role_id != ? ', 1);
				$select->where('role_id != ? ', 2);
				$select->where('role_id != ? ', 3);
				break;
		}
		
		if($roleId == 1 || $roleId == 2 || $roleId == 3){
			$resultSet	=	$this->getDbTable()->fetchAll($select);
			foreach ($resultSet as $row) {		
				$obj	=	new Application_Model_AclRoles();
				$obj->setRoleId($row->role_id);
				$obj->setRoleName($row->role_name);
				$obj->setDescription($row->description);
				$objArr[] = $obj;
			}
		}
		return $objArr;
    }
	
	public function fetchRolesArr( $roleId ){
		
		$roleArr = array();
		switch($roleId){
			case 1:
				$select = $this->getDbTable()->select();
				$select->order(array('role_id'));
				$select->where('role_id != ? ', 1);
				break;
			case 2:
				$select = $this->getDbTable()->select();
				$select->order(array('role_id'));
				$select->where('role_id != ? ', 1);
				$select->where('role_id != ? ', 2);
				break;
			case 3:
				$select = $this->getDbTable()->select();
				$select->order(array('role_id'));
				$select->where('role_id != ? ', 1);
				$select->where('role_id != ? ', 2);
				$select->where('role_id != ? ', 3);
				break;
			default:
				$select = $this->getDbTable()->select();
				$select->order(array('role_id'));
				$select->where('role_id != ? ', 1);
				$select->where('role_id != ? ', 2);
				$select->where('role_id != ? ', 3);
		}
		$resultSet	=	$this->getDbTable()->fetchAll($select);
		foreach ($resultSet as $row) {		
				$roleArr[$row->role_id] = $row->role_name;
		}
		return $roleArr;
	}
	
	
	 public function save(Application_Model_AclRoles $role) {
		$data = array(
            'role_id' 		=> $role->getRoleId(),
            'role_name' 	=> $role->getRoleName(),
			'description'	=> $role->getDescription(),
			'iscp' 		=> $role->getIs()
        );
        if ('' == ($id = $role->getRoleId())) {
            unset($data['role_id']);
            $this->getDbTable()->insert($data);
        } else {
            $this->getDbTable()->update($data, array('role_id = ?' => $id));
        }
    }
	
	public function fetchById( $roleId ){
        $select = $this->getDbTable()->select();
        $select->where('role_id = ?', $roleId);
        $row = $this->getDbTable()->fetchrow($select);
		$obj = new Application_Model_AclRoles();
		$obj->setRoleId($row->role_id);
		$obj->setRoleName($row->role_name);
		$obj->setDescription($row->description);
		$obj->setIs($row->iscp);
        return $obj;
    }
  	
	public function loadUserRoles($roleId){
		$select = $this->getDbTable()->select();
        
		switch($roleId){
			case 1:
				  $select->where('role_id != 1 AND role_id != 4');
				  break;
			case 2:
				  $select->where('role_id != 1 AND role_id != 2 AND role_id != 4');
				  break;
			default:
				  $select->where('role_id != 1 AND role_id != 2 AND role_id != 3 AND role_id != 4');
		}
		$resultSet	=	$this->getDbTable()->fetchAll($select);
		$dataArr = array();
		foreach ($resultSet as $row) {	
			$dataArr[$row->role_id] = $row->role_name;
		}
		return $dataArr;
	}

} // $

