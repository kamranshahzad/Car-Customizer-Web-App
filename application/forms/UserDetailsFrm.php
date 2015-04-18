<?php

class Application_Form_UserDetailsFrm extends Zend_Form
{


	public function init(){
	
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('news');
		$this->setAttrib('id','news');	
		$this->setDescription("News Form");
		
 		$nid = new Zend_Form_Element_Hidden('nid');
		$nid->addFilter('StringTrim');
		$nid->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$title = new Zend_Form_Element_Text('title');
		$title->setLabel('New Title :');		
		$title->setRequired(true);
		$title->addErrorMessage('The title is required!');
		$title->addFilter('StringTrim');  
		$title->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		

		$date = new Zend_Form_Element_Text('date');
		$date->setLabel('Date :');		
		$date->setRequired(true);
		$date->addErrorMessage('The date is required!');
		$date->addFilter('StringTrim');  
		$date->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));

		$des = new Zend_Form_Element_Textarea('des');
		$des->setLabel('Year Description:');
		$des->setAttrib('cols', '40')->setAttrib('rows', '4');
 		$des->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td' )),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
		$status = new Zend_Form_Element_Checkbox('status');
        $status->setLabel('Enabled?');
		$status->setCheckedValue(true);
		$status->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
	   
	   
		$submit->setIgnore(true);
		$this->addElement($nid);
		$this->addElement($title);
		$this->addElement($date);
		$this->addElement($des);
		$this->addElement($status);
		$this->addElement($submit);
		
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
		
		
	}
		
	
	
} //$