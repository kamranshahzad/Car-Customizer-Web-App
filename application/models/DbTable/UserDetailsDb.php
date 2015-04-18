<?php

class Application_Model_DbTable_UserDetailsDb extends Zend_Db_Table_Abstract{

    protected $_name = 'user_details';
	protected $_primary = 'id';
	
	protected $_referenceMap    = array(
        'usersRef' => array(
            'columns'           => 'uid',
            'refTableClass'     => 'Application_Model_DbTable_UserDb',
            'refColumns'        => 'uid'
        )
    );
	
	
	
} //$

