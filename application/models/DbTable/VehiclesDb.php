<?php

class Application_Model_DbTable_VehiclesDb extends Zend_Db_Table_Abstract{

    protected $_name = 'vehicles';
	protected $_primary = 'vehicle_id';
	protected $_dependentTables  = array(
										 'Application_Model_DbTable_DealsDb'
										 );
		

}

