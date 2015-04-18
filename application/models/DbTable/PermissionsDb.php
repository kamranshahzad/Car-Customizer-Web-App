<?php

class Application_Model_DbTable_PermissionsDb  extends Zend_Db_Table_Abstract{

    protected $_name = 'acl_permissions';
	protected $_primary = 'pid';
	
	
	protected $_referenceMap    = array(
        'ResourceRef' => array(
            'columns'           => 'resource_id',    // inside same tbl
            'refTableClass'     => 'Application_Model_DbTable_ResourceDb',
            'refColumns'        => 'rid'    // parent tbl column
        ),
        'RoleRef' => array(
            'columns'           => 'role_id',
            'refTableClass'     => 'Application_Model_DbTable_RoleDb',
            'refColumns'        => 'role_id'
        )
    );
	
}//


/*  how to use this

$accountsTable = new Accounts();
$accountsRowset = $accountsTable->find(1234);
$user1234 = $accountsRowset->current();
 
$bugsAssignedToUser = $user1234->findDependentRowset('Bugs', 'Engineer');
*/


/*
'Product' => array(
            'columns'           => array('product_id'),
            'refTableClass'     => 'Products',
            'refColumns'        => array('product_id'),
            'onDelete'          => self::CASCADE,
            'onUpdate'          => self::RESTRICT
        ),
*/