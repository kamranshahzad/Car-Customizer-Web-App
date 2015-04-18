<?php

class Application_Model_DbTable_PartsDb extends Zend_Db_Table_Abstract
{

    protected $_name = 'parts';
	protected $_primary = 'part_id';
	
	protected $_dependentTables  = array(
										 'Application_Model_DbTable_DealAccesoriesDb'
										 );
	
	
}

