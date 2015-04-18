<?php

class Application_Model_DbTable_ManufacturerDb extends Zend_Db_Table_Abstract{

    protected $_name = 'part_manufacturer';
	protected $_primary = 'manufacturer_id';
	protected $_dependentTables  = array(
									 'Application_Model_DbTable_PartsDb',
									 'Application_Model_DbTable_WheelsDb'
									 );
	
	
} //$

