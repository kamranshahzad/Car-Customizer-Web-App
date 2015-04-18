<?php

class Application_Form_RoleSubFrm extends Zend_Form
{
	private $rolesArr;
	
	public function setFormData($arr){
		$this->rolesArr = $arr;
	}
	
	
	public function init(){ }
		
	
	public function buildForm( $roleArr ){
		
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('rolesub');
		$this->setAttrib('id','rolesub');	
		$this->setDescription("Sub Role Form");
		
		$this->addElement('hidden', 'subrole', array(
      		'value' => 1
 		));
 		
		$roleId = new Zend_Form_Element_Hidden('roleId');
		$roleId->addFilter('StringTrim');
		$roleId->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
			  
		$roleName = new Zend_Form_Element_Select('roleName');
		$roleName->setLabel('Select Users Role:'); 
		$roleName->addMultiOptions($roleArr);
		$roleName->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
		$submit->setIgnore(true);
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
		
		$this->addElement($roleId);
		$this->addElement($roleName);
		$this->addElement($submit);
		
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
			
	}
	
}  //$

     