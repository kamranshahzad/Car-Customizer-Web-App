<?php

class Application_Model_DbTable_UserBackgroundDb extends Zend_Db_Table_Abstract{

    protected $_name = 'user_backgrounds';
	protected $_primary = 'id';
	protected $_referenceMap    = array(
        'usersRef' => array(
            'columns'           => 'uid',
            'refTableClass'     => 'Application_Model_DbTable_UserDb',
            'refColumns'        => 'uid'
        ),
		'BackgroundRef' => array(
            'columns'           => 'background_id',
            'refTableClass'     => 'Application_Model_DbTable_BackgroundDb',
            'refColumns'        => 'background_id'
        )
    );

}

