<?php

class Application_Form_YearFrm extends Zend_Form{

	
	public function init(){
		
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('year');
		$this->setAttrib('id','year');	
		$this->setDescription("Year Form");
		
 		$yearId = new Zend_Form_Element_Hidden('yearId');
		$yearId->addFilter('StringTrim');
		$yearId->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));

		
		$year = new Zend_Form_Element_Text('year');
		$year->setLabel('Year Title :');		
		$year->setRequired(true);
		$year->addErrorMessage('The year title is required!');
		$year->addFilter('StringTrim');  
		$year->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
	   
		
		$des = new Zend_Form_Element_Textarea('des');
		$des->setLabel('Year Description:');
		$des->setAttrib('cols', '40')->setAttrib('rows', '4');
 		$des->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td' )),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
	   
	   
		$submit->setIgnore(true);
		$this->addElement($yearId);
		$this->addElement($year);
		$this->addElement($des);
		$this->addElement($submit);
		
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
			
	}
	
}  //$

    