<?php

class Application_Model_Mapper_UserMapper {

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
            $this->setDbTable('Application_Model_DbTable_UserDb');
        }
        return $this->_dbTable;
    }
	
	/*
	public function save($data , $permObj  , $role_id){
		$permObj->permissionsWorker( $data ,$role_id );
	}
	*/
	
	
	 public function save(Application_Model_User $obj , $db , $roleId , $currentUserId ) {
        
		if($this->checkUserName($obj->getUserName())){
			return false;
		}else{
			
			if($obj->getRoleId() == 3){
				$data = array(
					'dealer_id' => 0,
					'ref'       => $currentUserId,
					'uname' 	=> $obj->getUserName(),
					'password'	=> $obj->getPassword(),
					'email' 	=> $obj->getEmail(),
					'role_id' 	=> $obj->getRoleId(),
					'enabled' 	=> $obj->getEnabled()
				);
				$uid = $this->getDbTable()->insert($data);
				$this->runDealerData($db , $uid);
			}else{
				$data = array(
					'dealer_id' => $obj->getDealerId(),
					'ref'       => $currentUserId,
					'uname' 	=> $obj->getUserName(),
					'password'	=> $obj->getPassword(),
					'email' 	=> $obj->getEmail(),
					'role_id' 	=> $obj->getRoleId(),
					'enabled' 	=> $obj->getEnabled()
				);
				$uid = $this->getDbTable()->insert($data);
			}
			return true;	
		}
    }
	
	
	public function checkUserName($username){
		$select = $this->getDbTable()->select();
        $select->where('uname = ?', $username);
		$rs = $this->getDbTable()->fetchAll($select);	
		return count($rs);
	}
	
	
	public function runDealerData( $db , $uid){
		$userParts = $db->prepare("Call UserParts( ? , ? )");
		$userParts->execute(array($uid,'p'));
		
		$userWheels = $db->prepare("Call UserWheels( ? , ? )");
		$userWheels->execute(array($uid,'w'));
		
		$partCategories = $db->prepare("Call UserPartCateogies( ? )");
		$partCategories->execute(array($uid));
		
		$partTypes = $db->prepare("Call UserPartTypes( ? )");
		$partTypes->execute(array($uid));
		
		$partManufact = $db->prepare("Call UserPartManufacturer( ? )");
		$partManufact->execute(array($uid));
		
		$wheelTypes = $db->prepare("Call UserWheelTypes( ? )");
		$wheelTypes->execute(array($uid));
		
		$wheelTypes = $db->prepare("Call UserWheelTypes( ? )");
		$wheelTypes->execute(array($uid));
		
		$userDefaults = $db->prepare("Call InsertUserDefaults( ? )");
		$userDefaults->execute(array($uid));
		
		$userDetails = $db->prepare("Call InsertUserDetails( ? )");
		$userDetails->execute(array($uid));
		
		$bgs = $db->prepare("Call InsertBackgrounds( ? )");
		$bgs->execute(array($uid));
	}
	
	
	public function status($uid , $mailhlp){
		if($this->getUserStatus($uid)){
			$data = array(
				'enabled' => 0 
			);
			$mailhlp->sendBlockUnBlockUserMail('Addoncars : User Un-Activation ' , $uid , 2);
		}else{
			$data = array(
				'enabled' => 1 
			);
			$mailhlp->sendBlockUnBlockUserMail('Addoncars : User Activation ',$uid , 1);
		}
		$this->getDbTable()->update($data, array('uid = ?' => $uid));
		
	}
	
	public function getUserStatus($uid){
		$select = $this->getDbTable()->select();
        $select->where('uid = ?', $uid);
        $row = $this->getDbTable()->fetchrow($select);
        return $row->enabled;
	}
	
	
	public function remove( $uid , $db){
		if( $this->isDealer($uid) == 3 ){
			$this->getDbTable()->delete(array('uid = ?' => $uid));
			$this->removeChildUsers($db , $uid );
			$this->removeDealer($db , $uid);
		}else{
			$this->removeChildUsers($db , $uid );
			$this->getDbTable()->delete(array('uid = ?' => $uid));
		}
	}
	
	public function removeDealer( $db , $uid ){
		$sql = "DELETE from users WHERE dealer_id  = '".$uid."' ";
		$db->query($sql);
		$sql = "DELETE from user_defaults WHERE uid = '".$uid."' ";
		$db->query($sql);
		$sql = "DELETE from user_details WHERE uid = '".$uid."' ";
		$db->query($sql);
		$sql = "DELETE from user_parts WHERE uid = '".$uid."' ";
		$db->query($sql);
		$sql = "DELETE from user_part_categories WHERE uid = '".$uid."' ";
		$db->query($sql);
		$sql = "DELETE from user_part_manufactures WHERE uid = '".$uid."' ";
		$db->query($sql);
		$sql = "DELETE from user_part_types WHERE uid = '".$uid."' ";
		$db->query($sql);
		$sql = "DELETE from user_wheel_types WHERE uid = '".$uid."' ";
		$db->query($sql);
		$sql = "DELETE from user_backgrounds WHERE uid = '".$uid."' ";
		$db->query($sql);
	}
	
	public function removeChildUsers($db , $uid ){
		$select = $db->select()->from("users")->where('ref=?',$uid);
		$stmt = $select->query();
		$total = $db->fetchOne("select FOUND_ROWS()");
		if($total > 0){
			$childUser = $db->prepare("DELETE FROM users WHERE ref = ?");
			$childUser->execute(array($uid));	
		}
	}
	
	public function isDealer($uid){
		$select = $this->getDbTable()->select();
        $select->where('uid = ?', $uid);
        $row = $this->getDbTable()->fetchrow($select);
        return $row->role_id;
	}
	
	
	
	
	 public function fetchByUid($id) {
        $select = $this->getDbTable()->select();
        $select->where('uid = ?', $id);
        $row = $this->getDbTable()->fetchrow($select);
        if (0 == count($row)) {
            return;
        }
        //$row = $result->current();
        $user = new Application_Model_User();
        $user->getUserId($row->uid);
        $user->setDealerId($row->dealer_id);
        $user->setUserName($row->uname);
        $user->setPassword($row->password);
        $user->setEmail($row->email);
        $user->setRoleId($row->role_id);
        return $user;
    }


	/*
    public function save(Application_Model_User $user) {
        $data = array(
            'uid' => $user->getUid(),
            'dealer_id' => $user->getdealerId(),
            'uname' => $user->getUname(),
            'password' => $user->getPassword(),
            'email' => $user->getEmail(),
            'role' => $user->getRole()
        );
        if ('' == ($id = $user->getUid())) {
            unset($data['uid']);
           return $this->getDbTable()->insert($data);
			
        } else {
            $this->getDbTable()->update($data, array('uid = ?' => $id));
			return 'updated';
        }
    }	
    public function fetchById($id) {
        $select = $this->getDbTable()->select();
        $select->where('uid = ?', $id);
        $row = $this->getDbTable()->fetchrow($select);
        if (0 == count($row)) {
            return;
        }
        //$row = $result->current();
        $user = new Application_Model_User();
        $user->setUid($row->uid);
        $user->setDealerId($row->dealer_id);
        $user->setUname($row->uname);
        $user->setPassword($row->password);
        $user->setEmail($row->email);
        $user->setRole($row->role);
        return $user;
    }

    public function fetchAll() {
        $select = $this->getDbTable()->select();
        $select->order(array('uname'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $users = array();

        foreach ($resultSet as $row) {

            $user = new Application_Model_User();
            $user->setUid($row->uid);
            $user->setDealerId($row->dealer_id);
            $user->setUname($row->uname);
            $user->setPassword($row->password);
            $user->setEmail($row->email);
            $user->setRole($row->role);

            $users[] = $user;
        }

        return $users;
    }
	

    public function fetchAllDealers() {
        $select = $this->getDbTable()->select();
        $select->where('role = ?', 'dealer');
        $select->order(array('uname'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $users = array();

        foreach ($resultSet as $row) {

            $user = new Application_Model_User();
            $user->setUid($row->uid);
            $user->setDealerId($row->dealer_id);
            $user->setUname($row->uname);
            $user->setPassword($row->password);
            $user->setEmail($row->email);
            $user->setRole($row->role);
            
            $users[] = $user;
        }

        return $users;
    }

     public function fetchAllUsersByDealerId($dealerId) {
        $select = $this->getDbTable()->select();
        $select->where('dealer_id = ?', $dealerId);
        $select->order(array('uname'));
        $resultSet = $this->getDbTable()->fetchAll($select);
        $users = array();

        foreach ($resultSet as $row) {

            $user = new Application_Model_User();
            $user->setUid($row->uid);
            $user->setDealerId($row->dealer_id);
            $user->setUname($row->uname);
            $user->setPassword($row->password);
            $user->setEmail($row->email);
            $user->setRole($row->role);

            $users[] = $user;
        }
        return $users;
    }
	
	

    public function countAll($dealerId) {
        $select = $this->getDbTable()->select();
        $select->where('dealer_id = ?', $dealerId);
        $resultSet = $this->getDbTable()->fetchAll($select);
            return count($resultSet);
    }

    public function delete($id) {
        $result = $this->getDbTable()->delete('uid=' . (int) $id);
        return $result;
    }
	*/
	
	
	// %K
	
	public function fetchUserByRef( $roleId , $currentUserid   ){
		$select = $this->getDbTable()->select();
		if($roleId == 1){
			$select->where('uid != ?' , 1);
		}else{
			$select->where('ref = ?' , $currentUserid );
		}
		
        $resultSet = $this->getDbTable()->fetchAll($select);
		if (0 == count($resultSet)) {
            return;
        }
        $users = array();
        foreach ($resultSet as $row) {
			$user = new Application_Model_User();
            $user->setUserId($row->uid);
			$user->setRef($row->ref);
            $user->setDealerId($row->dealer_id);
            $user->setUserName($row->uname);
           	$user->setPassword($row->password);
           	$user->setEmail($row->email);
            $user->setRoleId($row->role_id);
			$user->setEnabled($row->enabled);
			
            $users[] = $user;
        }
        return $users;
	}
	
	public function isChildUserExist( $parentId ){
		$select = $this->getDbTable()->select()->from("users")->where('dealer_id=?',$parentId);
		return count($this->getDbTable()->fetchrow($select));
	}
	
	public function getChildUser( $parentId ){
		$select = $this->getDbTable()->select();
		$select->where('dealer_id = ?' , $parentId);
        $resultSet = $this->getDbTable()->fetchAll($select);
		$users = array();
        foreach ($resultSet as $row) {
			$user = new Application_Model_User();
            $user->setUserId($row->uid);
            $user->setDealerId($row->dealer_id);
            $user->setUserName($row->uname);
           	$user->setPassword($row->password);
           	$user->setEmail($row->email);
            $user->setRoleId($row->role_id);

            $users[] = $user;
        }
        return $users;
	}
	
	
	
	
	
	
	
}  // $class

