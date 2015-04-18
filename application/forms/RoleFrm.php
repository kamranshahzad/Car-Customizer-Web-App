<?php

class Application_Form_RoleFrm extends Zend_Form
{
	private $rolesArr;
	
	public function setFormData($arr){
		$this->rolesArr = $arr;
	}
	
	
	public function init(){
		
		
		$this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('role');
		$this->setAttrib('id','role');	
		$this->setDescription("Role Form");
		
 		$roleId = new Zend_Form_Element_Hidden('roleId');
		$roleId->addFilter('StringTrim');
		$roleId->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));

		
		$roleName = new Zend_Form_Element_Text('roleName');
		$roleName->setLabel('Role :');		
		$roleName->setRequired(true);
		$roleName->addErrorMessage('The Role is required!');
		$roleName->addFilter('StringTrim');  
		$roleName->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
	   
		
		$description = new Zend_Form_Element_Textarea('description');
		$description->setLabel('Role Description:');
		$description->setAttrib('cols', '40')->setAttrib('rows', '4');
 		$description->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td' )),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$is = new Zend_Form_Element_Checkbox('is');
        $is->setLabel('C Panel?');
		$is->setCheckedValue(true);
		$is->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
	   
	   
		$submit->setIgnore(true);
		$this->addElement($roleId);
		$this->addElement($roleName);
		$this->addElement($description);
		$this->addElement($is);
		$this->addElement($submit);
		
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
			
	}
	
}  //$

       /*
		$country = new Zend_Form_Element_Select('User Roles');
		$country ->setLabel('Countries:')->addMultiOptions(array('US' => 'United States','UK' => 'United Kingdom'));
		*/