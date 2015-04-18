<?php

class Application_Form_VarFrm extends Zend_Form
{
		
	public function init(){
		
		$this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('var');
		$this->setAttrib('id','variable');	
		$this->setDescription("Variable Form");
		
		$varName = new Zend_Form_Element_Text('varName');
		$varName->setLabel('Variable Key :');		
		$varName->setRequired(true);
		$varName->addErrorMessage('The variable key is required!');
		$varName->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$varValue = new Zend_Form_Element_Textarea('varValue');
		$varValue->setLabel('Variable Value:');
		$varValue->setAttrib('cols', '40')->setAttrib('rows', '4');
 		$varValue->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
		
		$submit->setIgnore(true);
		$this->addElement($varName);
		$this->addElement($varValue);
		$this->addElement($submit);	
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
		
	}
	
}
