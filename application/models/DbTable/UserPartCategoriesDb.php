<?php

class Application_Model_DbTable_UserPartCategoriesDb extends Zend_Db_Table_Abstract{

    protected $_name = 'user_part_categories';
	protected $_primary = 'id';
	
	
	
	protected $_referenceMap    = array(
        'usersRef' => array(
            'columns'           => 'uid',
            'refTableClass'     => 'Application_Model_DbTable_UserDb',
            'refColumns'        => 'uid'
        ),
		'partCategoriesRef' => array(
            'columns'           => 'part_category_id',
            'refTableClass'     => 'Application_Model_DbTable_PartCategoryDb',
            'refColumns'        => 'part_category_id'
        )
    );

}

