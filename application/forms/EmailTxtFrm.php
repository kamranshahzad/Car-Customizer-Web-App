<?php

class Application_Form_EmailTxtFrm extends Zend_Form {
		
	public function init(){
		
		$this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('var');
		$this->setAttrib('id','variable');	
		$this->setDescription("Variable Form");
		
		$varType = new Zend_Form_Element_Hidden('varType');
		$varType->setValue('mail');
		$varType->addFilter('StringTrim');
		$varType->removeDecorator('label');
		$varType->removeDecorator('HtmlTag');
		
		$varName = new Zend_Form_Element_Text('varName');
		$varName->setLabel('Email Title :');		
		$varName->setRequired(true);
		$varName->addErrorMessage('The email title is required!');
		$varName->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$varValue = new Zend_Form_Element_Textarea('varValue');
		$varValue->setLabel('Email Body:');
		$varValue->setAttrib('cols', '40')->setAttrib('rows', '4');
 		$varValue->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
		
		$submit->setIgnore(true);
		$this->addElement($varType);
		$this->addElement($varName);
		$this->addElement($varValue);
		$this->addElement($submit);	
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
		
	}
	
}
