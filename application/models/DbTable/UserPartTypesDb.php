<?php

class Application_Model_DbTable_UserPartTypesDb extends Zend_Db_Table_Abstract{

    protected $_name = 'user_part_types';
	protected $_primary = 'id';
	
	protected $_referenceMap    = array(
        'usersRef' => array(
            'columns'           => 'uid',
            'refTableClass'     => 'Application_Model_DbTable_UserDb',
            'refColumns'        => 'uid'
        ),
		'partTypeRef' => array(
            'columns'           => 'part_type_id',
            'refTableClass'     => 'Application_Model_DbTable_PartTypeDb',
            'refColumns'        => 'part_type_id'
        )
    );

}

