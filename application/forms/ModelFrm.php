<?php

class Application_Form_ModelFrm extends Zend_Form
{
	public function init(){}
	
	public function buildForm(){
		
		  $this->addElement('hidden', 'frmid', array(
			'value' => 1
		  ));
		 
		  $this->addElement('text', 'name', array(
			'required' => true,
			'label'    => 'Name',
			'order'    => 2,
		  ));
		 
		  $this->addElement('button', 'addElement', array(
			'label' => 'Add',
			'order' => 91
		  ));
		 
		  $this->addElement('button', 'removeElement', array(
			'label' => 'Remove',
			'order' => 92
		  ));
		 
		  // Submit
		  $this->addElement('submit', 'submit', array(
			'label' => 'Submit',
			'order' => 93
		  ));
  
	}
	
	
	public function preValidation(array $data) {
 
  	// array_filter callback
	  function findFields($field) {
		// return field names that include 'newName'
			if (strpos($field, 'newName') !== false) {
			  return $field;
			}
		  }
		 
		  // Search $data for dynamically added fields using findFields callback
		  $newFields = array_filter(array_keys($data), 'findFields');
		 
		  foreach ($newFields as $fieldName) {
			// strip the id number off of the field name and use it to set new order
			$order = ltrim($fieldName, 'newName') + 2;
			$this->addNewField($fieldName, $data[$fieldName], $order);
		  }
		}
		
		
	  public function addNewField($name, $value, $order) {
		  $this->addElement('text', $name, array(
			'required'       => true,
			'label'          => 'Name',
			'value'          => $value,
			'order'          => $order
		  ));
	  }
	
} //$