<?php


class Zend_Controller_Action_Helper_Userloader extends Zend_Controller_Action_Helper_Abstract{
	
	private $db;
	
	public function __construct(){
      $this->db = Zend_Registry::get('database');
	}
	
	
	
}   // $ class


?>

