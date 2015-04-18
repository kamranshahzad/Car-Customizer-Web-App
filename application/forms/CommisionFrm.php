<?php

class Application_Form_CommisionFrm extends Zend_Form
{

	
	public function init(){
		
		
		$this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('commision');
		$this->setAttrib('id','commision');	
		$this->setDescription("Commision Form");
		
 		
		$id = new Zend_Form_Element_Hidden('id');
		$id->addFilter('StringTrim');
		$id->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$dealId = new Zend_Form_Element_Hidden('dealId');
		$dealId->addFilter('StringTrim');
		$dealId->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
		$quntity = new Zend_Form_Element_Text('quntity');
		$quntity->setLabel('Commisions Quantity :');		
		$quntity->setRequired(true);
		$quntity->addErrorMessage('The quantity is required!');
		$quntity->addFilter('StringTrim');  
		$quntity->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
	   
	   
		$type = new Zend_Form_Element_Select('type');
		$type->setLabel('User Roles'); 
		$type->addMultiOptions(array('p' => '% Persenage', 'a' => '$ Amount'));
		$type->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
		$submit->setIgnore(true);

		$this->addElement($id);
		$this->addElement($dealId);
		$this->addElement($quntity);
		$this->addElement($type);
		$this->addElement($submit);
		
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
			
	}
	
}  //$

       /*
		$country = new Zend_Form_Element_Select('User Roles');
		$country ->setLabel('Countries:')->addMultiOptions(array('US' => 'United States','UK' => 'United Kingdom'));
		*/