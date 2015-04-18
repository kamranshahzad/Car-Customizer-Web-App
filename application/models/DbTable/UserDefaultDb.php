<?php

class Application_Model_DbTable_UserDefaultDb extends Zend_Db_Table_Abstract{

    protected $_name = 'user_defaults';
	protected $_primary = 'did';
	
	protected $_referenceMap    = array(
        'usersRef' => array(
            'columns'           => 'uid',
            'refTableClass'     => 'Application_Model_DbTable_UserDb',
            'refColumns'        => 'uid'
        )
    );
	
	
}//$

