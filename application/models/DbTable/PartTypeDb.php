<?php

class Application_Model_DbTable_PartTypeDb extends Zend_Db_Table_Abstract{

    protected $_name = 'part_types';
	protected $_primary = 'part_type_id';
	protected $_dependentTables  = array(
									 'Application_Model_DbTable_PartCategoryDb',
									 'Application_Model_DbTable_UserPartCategoriesDb',
									 'Application_Model_DbTable_UserPartTypesDb'
									 );
	
}

