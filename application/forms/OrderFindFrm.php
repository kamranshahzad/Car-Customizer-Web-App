<?php

class Application_Form_OrderFindFrm extends Zend_Form
{
	
	public function init(){
		
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('findorder');
		$this->setAttrib('id','findorder');	
		$this->setDescription("Find Order Form");
		
		
			  
		$ref = new Zend_Form_Element_Text('ref');
		$ref->setLabel('Order Id# ');		
		$ref->setRequired(true);
		$ref->addErrorMessage('The Order no is required!');
		$ref->addFilter('StringTrim');
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setIgnore(true);

		$this->addElement($ref);
		$this->addElement($submit);
		
			
	}
	
}  //$
