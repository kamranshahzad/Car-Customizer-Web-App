<?php

class Application_Form_IndexLoginFrm extends Zend_Form
{
	public function init()
    {
        $this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('index-login');
		$this->setAttrib('id','index-login');	
		$this->setDescription("Login Form");
		
 		$userName = new Zend_Form_Element_Text('username');
		//$userName->setLabel('Username');
		$userName->removeDecorator('label');
		$userName->removeDecorator('HtmlTag');  
		$userName->removeDecorator('Errors');    
		//$userName->setValue('Username');
		$userName->setRequired(true);
		$userName->addErrorMessage('The username is required!');
		$userName->addFilter('StringTrim');
		$userName->setAttrib('class','input');
		
 		$password = new Zend_Form_Element_Password('password');
		//$password->setLabel('Password');
		//$password->setValue('abcdefgh');
		$password->setRequired(true);
		$password->addErrorMessage('The password is required!');
		$password->addFilter('StringTrim');
		$password->removeDecorator('label');
		$password->removeDecorator('HtmlTag');
		$password->removeDecorator('Errors');
		//$password->setAttrib('value','abcdefgh');
		$password->setAttrib('class','input'); 
		   
        
 		$submit = new Zend_Form_Element_Image('submit');
		$submit->setLabel('');
		$submit->setImage('images/login-btn.gif');
    	$submit->removeDecorator('label');
		$submit->removeDecorator('HtmlTag');     
		$submit->setIgnore(true);
		
		$this->addElement($userName);
		$this->addElement($password);
		$this->addElement($submit);
    }


}

