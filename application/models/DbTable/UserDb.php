<?php

class Application_Model_DbTable_UserDb extends Zend_Db_Table_Abstract{

    protected $_name 	= 'users';
	protected $_primary = 'uid';
	protected $_rowClass = 'UserRow';
	protected $_dependentTables  = array(
										 'Application_Model_DbTable_UserDb',
										 'Application_Model_DbTable_PermissionsDb' ,
										 'Application_Model_DbTable_UserBackgroundDb'
										 );
	
	protected $_referenceMap    = array(
        'RoleTag' => array(
            'columns'           => 'role_id',
            'refTableClass'     => 'Application_Model_DbTable_RoleDb',
            'refColumns'        => 'role_id'
        )
    );
	
	
} // ends



class UserRow extends Zend_Db_Table_Row_Abstract{
    
	public function name(){
        return $this->uname . ' ' . $this->password;
    }

}
