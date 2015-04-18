<?php

class Application_Model_DbTable_DealsDb extends Zend_Db_Table_Abstract{

    protected $_name = 'deals';
	protected $_primary = 'deal_id';
	protected $_dependentTables  = array(
										 'Application_Model_DbTable_CommisionsDb',
										 'Application_Model_DbTable_DealAccesoriesDb',
										 'Application_Model_DbTable_DealCommissionDb',
										 'Application_Model_DbTable_DealDetailDb',
										 'Application_Model_DbTable_InvoiceDb',
										 'Application_Model_DbTable_DealStatusDb');
	
	
	protected $_referenceMap    = array(
        'usersRef' => array(
            'columns'           => 'uid',
            'refTableClass'     => 'Application_Model_DbTable_UserDb',
            'refColumns'        => 'uid'
        ),
		'vehicleRef' => array(
            'columns'           => 'vehicle_id',
            'refTableClass'     => 'Application_Model_DbTable_VehiclesDb',
            'refColumns'        => 'vehicle_id'
        )
    );
	
	
} //$

