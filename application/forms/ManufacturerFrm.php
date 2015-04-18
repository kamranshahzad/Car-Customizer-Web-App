<?php

class Application_Form_ManufacturerFrm extends Zend_Form{

	
	public function init(){
		$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
		
		$roleId = strtolower($identity['roleId']);
		
		
		
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('man');
		$this->setAttrib('id','man');	
		$this->setDescription("Manufacturers Form");
		
 		$manId = new Zend_Form_Element_Hidden('manId');
		$manId->addFilter('StringTrim');
		$manId->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));

		
		
		$manName = new Zend_Form_Element_Text('manName');
		$manName->setLabel('Manufactuere Title :');		
		$manName->setRequired(true);
		$manName->addErrorMessage('The manufacturer name is required!');
		$manName->addFilter('StringTrim');  
		$manName->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
	   
		
		$note = new Zend_Form_Element_Textarea('note');
		$manName->setRequired(true);
		$note->setLabel('Manufactuere Note:');
		$manName->addErrorMessage('The manufacturer description is required!');
		$note->setAttrib('cols', '40')->setAttrib('rows', '4');
 		$note->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td' )),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$status = new Zend_Form_Element_Checkbox('status');
        $status->setLabel('Enabled?');
		$status->setCheckedValue(true);
		$status->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
	   
	   
		$submit->setIgnore(true);
		$this->addElement($manId);
		if($roleId != 3){
			$this->addElement($manName);
		}
		$this->addElement($note);
		if($roleId != 3){
			$this->addElement($status);
		}
		$this->addElement($submit);
		
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
			
	}
	
}  //$

    