<?php

class Application_Model_DbTable_CommisionsDb extends Zend_Db_Table_Abstract{

    protected $_name = 'commisions';
	protected $_primary = 'id';
	
	protected $_referenceMap    = array(
        'dealRef' => array(
            'columns'           => 'deal_id',
            'refTableClass'     => 'Application_Model_DbTable_DealsDb',
            'refColumns'        => 'deal_id'
        )
    );
	
	
	
}//$

