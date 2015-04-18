<?php

class Application_Model_DbTable_PartCategoryDb extends Zend_Db_Table_Abstract{

    protected $_name = 'part_categories';
	protected $_primary = 'part_category_id';
	protected $_dependentTables  = array(
										 'Application_Model_DbTable_UserPartCategoriesDb',
										 'Application_Model_DbTable_PartsDb' 
										 );
	
	
	
}//$

