<?php

class Application_Model_DbTable_RoleDb extends Zend_Db_Table_Abstract{

    protected $_name = 'acl_roles';
	protected $_primary = 'role_id';
	protected $_dependentTables  = array(
										 'Application_Model_DbTable_UserDb',
										 'Application_Model_DbTable_PermissionsDb' 
										 );
}

