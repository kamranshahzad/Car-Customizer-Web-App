<?php

class Application_Form_UserDetailFrm extends Zend_Form{
	
	public $options;
	
	public function init()
    {
		
        $this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('userdetail');
		$this->setAttrib('id','userdetail');	
		$this->setDescription("User Details Form");
				
 		$bgId = new Zend_Form_Element_Hidden('bgId');
		$bgId->addFilter('StringTrim');
		$bgId->removeDecorator('label');
		$bgId->removeDecorator('HtmlTag');
		
		$bgName = new Zend_Form_Element_Text('bgName');
		$bgName->setLabel('Background Title:');		
		$bgName->setRequired(true);
		$bgName->addErrorMessage('The Background title is required!');
		$bgName->addFilter('StringTrim');
		$bgName->setAttrib('class','input1');
		$bgName->addDecorators(array(array('Errors', array('class'=>'red15')), array('HtmlTag', array('tag' => 'p')), array('Label', array('tag' => 'p', 'class'=>'blck15' ))));    
		
		$oldIcon = new Zend_Form_Element_Hidden('oldIcon');
		 
		$BgImage = new Zend_Form_Element_File('BgImage');
		$BgImage->setLabel('Upload an Background Image:');
        $BgImage->setDestination('assets/makes');
        $BgImage->setValueDisabled(true);
		$BgImage->addValidator('Extension', false, 'png,gif');
		$BgImage->addDecorators(array(array('Errors', array('class'=>'red15')), array('HtmlTag', array('tag' => 'p')), array('Label', array('tag' => 'p', 'class'=>'blck15' )))); 
		
		$enabled = new Zend_Form_Element_Checkbox('enabled');
        $enabled->setLabel('Enabled?');
		$enabled->setCheckedValue(true);
		$enabled->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
 		$submit = new Zend_Form_Element_Submit('submit');		
		$submit->removeDecorator('DtDdWrapper');
		$submit->addDecorators(array(array('HtmlTag', array('tag' => 'p'))));
        $submit->setAttrib('class', 'submitButton');
		$submit->setIgnore(true);
		
		$this->addElement($bgId);
		$this->addElement($bgName);
		$this->addElement($oldIcon);
		$this->addElement($BgImage);
		$this->addElement($enabled);
		$this->addElement($submit);

    }


} // $

