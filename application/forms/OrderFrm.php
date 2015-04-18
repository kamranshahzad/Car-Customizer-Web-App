<?php

class Application_Form_OrderFrm extends Zend_Form{

	public function init(){
		$this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('myaccount');
		$this->setAttrib('id','myaccount');	
		$this->setDescription("My Account Form");
		
 		$uid = new Zend_Form_Element_Hidden('uid');
		$uid->addFilter('StringTrim');
		$uid->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));

		
		$password = new Zend_Form_Element_Password('password');
        $password->setLabel('Password:')
        ->addFilter('stripTags')
        ->addFilter('StringTrim')
        ->setRequired(true);
		$password->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$confirm_password = new Zend_Form_Element_Password('confirm_password');
        $confirm_password->setLabel('Confirm the password:')
        ->addFilter('stripTags')
        ->addFilter('StringTrim')
        ->addValidator('Identical')
        ->setRequired(true);
		$confirm_password->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$email = new Zend_Form_Element_Text('email');
		$email->setLabel('Email :');		
		$email->setRequired(true);
		$email->addErrorMessage('The email is required!');
		$email->addFilter('StringTrim');  
		$email->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
	   
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
	   
	   
		$submit->setIgnore(true);
		$this->addElement($uid);
		$this->addElement($password);
		$this->addElement($confirm_password);
		$this->addElement($email);
		$this->addElement($submit);
		
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
			
	}
	
	public function addPasswordOption()
    {
        $this->changePassword->loadDefaultDecorators();

        $this->getDisplayGroup('passwordGroup')
        ->addDecorators(array(
            array('HtmlTag', array('tag' => 'div','id' => 'div-password'))
            )
        );

        $this->password->setRequired(false);
        $this->confirm_password->setRequired(false);
    }

    public function setPasswordRequired($flag = true)
    {
        $this->password->setRequired($flag);
        $this->confirm_password->setRequired($flag);
    }

    public function isValid($data)
    {
        $confirm = $this->getElement('confirm_password');
        $confirm->getValidator('Identical')->setToken($data['password']);
        return parent::isValid($data);
    }
	
} // $
