<?php

class Application_Model_DbTable_ResourceDb extends Zend_Db_Table_Abstract{

    protected $_name = 'acl_resources';
	protected $_primary = 'rid';
	protected $_dependentTables  = array('Application_Model_DbTable_PermissionsDb');
	
}

