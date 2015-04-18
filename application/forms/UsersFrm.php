<?php

class Application_Form_UsersFrm extends Zend_Form
{
	public function init(){}
	
	public function buildForm($roleArr){
		
		
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('users');
		$this->setAttrib('id','users');	
		$this->setDescription("Users Form");
		
 		$uid = new Zend_Form_Element_Hidden('userId');
		$uid->addFilter('StringTrim');
		$uid->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$dealerId = new Zend_Form_Element_Hidden('dealerId');
		$dealerId->addFilter('StringTrim');
		$dealerId->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));

		
		$userName = new Zend_Form_Element_Text('userName');
		$userName->setLabel('Username :');		
		$userName->setRequired(true);
		$userName->addErrorMessage('The Username is required!');
		$userName->addFilter('StringTrim');  
		$userName->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$password = new Zend_Form_Element_Text('password');
		$password->setLabel('Password :');		
		$password->setRequired(true);
		$password->addErrorMessage('The Password is required!');
		$password->addFilter('StringTrim');  
		$password->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$email = new Zend_Form_Element_Text('email');
		$email->setLabel('Email :');		
		$email->setRequired(true);
		$email->addErrorMessage('The Email is required!');
		$email->addFilter('StringTrim');  
		$email->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
		$role_id = new Zend_Form_Element_Select('roleId');
        $role_id->setLabel('Select User Role:');
		$role_id->setMultiOptions($roleArr);
		$role_id->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
		$enabled = new Zend_Form_Element_Checkbox('enabled');
        $enabled->setLabel('Enabled?');
		$enabled->setCheckedValue(true);
		$enabled->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
	   
	   
		$submit->setIgnore(true);
		$this->addElement($uid);
		$this->addElement($dealerId);
		$this->addElement($userName);
		$this->addElement($password);
		$this->addElement($email);
		$this->addElement($role_id);
		$this->addElement($enabled);
		$this->addElement($submit);
		
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
	}
	
	
	
	
} //$



