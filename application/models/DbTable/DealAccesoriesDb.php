<?php

class Application_Model_DbTable_DealAccesoriesDb extends Zend_Db_Table_Abstract{

    protected $_name = 'deal_accessories';
	protected $_primary = 'aid';
	
	
	protected $_referenceMap    = array(
        'dealRef' => array(
            'columns'           => 'deal_id',
            'refTableClass'     => 'Application_Model_DbTable_DealsDb',
            'refColumns'        => 'deal_id'
        ),
		'partRef' => array(
            'columns'           => 'part_id',
            'refTableClass'     => 'Application_Model_DbTable_PartsDb',
            'refColumns'        => 'part_id'
        ),
		'wheelRef' => array(
            'columns'           => 'part_id',
            'refTableClass'     => 'Application_Model_DbTable_WheelsDb',
            'refColumns'        => 'wheel_id'
        )
    );

}

