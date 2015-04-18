<?php

class Application_Model_DbTable_UserPartsDb extends Zend_Db_Table_Abstract{

    protected $_name = 'user_parts';
	protected $_primary = 'id';
	
	
	protected $_referenceMap    = array(
        'usersRef' => array(
            'columns'           => 'uid',
            'refTableClass'     => 'Application_Model_DbTable_UserDb',
            'refColumns'        => 'uid'
        ),
		'partsRef' => array(
            'columns'           => 'part_id',
            'refTableClass'     => 'Application_Model_DbTable_PartsDb',
            'refColumns'        => 'part_id'
        ),
		'wheelsRef' => array(
            'columns'           => 'part_id',
            'refTableClass'     => 'Application_Model_DbTable_WheelsDb',
            'refColumns'        => 'wheel_id'
        )
    );
	
	
	
}//$

