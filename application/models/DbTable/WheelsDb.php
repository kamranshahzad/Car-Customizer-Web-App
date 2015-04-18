<?php

class Application_Model_DbTable_WheelsDb extends Zend_Db_Table_Abstract{

    protected $_name = 'wheels';
	protected $_primary = 'wheel_id';

	protected $_dependentTables  = array(
										 'Application_Model_DbTable_DealAccesoriesDb'
										 );


}//$

