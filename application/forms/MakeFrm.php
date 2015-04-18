<?php

class Application_Form_MakeFrm extends Zend_Form{
	
	public $options;
	
	public function init()
    {
		
        $this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('makefrm');
		$this->setAttrib('id','makefrm');	
		$this->setDescription("Makes Form");
				
 		$makeId = new Zend_Form_Element_Hidden('makeId');
		$makeId->addFilter('StringTrim');
		$makeId->removeDecorator('label');
		$makeId->removeDecorator('HtmlTag');
		
        
		$makeName = new Zend_Form_Element_Text('makeName');
		$makeName->setLabel('Make Name :');		
		$makeName->setRequired(true);
		$makeName->addErrorMessage('The Make Name is required!');
		$makeName->addFilter('StringTrim');
		$makeName->setAttrib('class','input1');
		$makeName->addDecorators(array(array('Errors', array('class'=>'red15')), array('HtmlTag', array('tag' => 'p')), array('Label', array('tag' => 'p', 'class'=>'blck15' ))));    
		
		
		$makeDes = new Zend_Form_Element_Textarea('makeDes');
		$makeDes->setLabel('Body Text:');
		$makeDes->setAttrib('cols', '40')->setAttrib('rows', '4');
		$makeDes->addDecorators(array(array('Errors', array('class'=>'red15')), array('HtmlTag', array('tag' => 'p')), array('Label', array('tag' => 'p', 'class'=>'blck15' ))));
	   	
		
		
        //$img = new Zend_Form_Element_Image('test');
 	
		
		$oldIcon = new Zend_Form_Element_Hidden('oldIcon');
		 
		$makeIcon = new Zend_Form_Element_File('makeIcon');
		$makeIcon->setLabel('Upload an Make Icon:');
        $makeIcon->setDestination('assets/makes');
        $makeIcon->setValueDisabled(true);
		$makeIcon->addValidator('Extension', false, 'png,gif');
		$makeIcon->addDecorators(array(array('Errors', array('class'=>'red15')), array('HtmlTag', array('tag' => 'p')), array('Label', array('tag' => 'p', 'class'=>'blck15' )))); 

 		$submit = new Zend_Form_Element_Submit('submit');		
		$submit->removeDecorator('DtDdWrapper');
		$submit->addDecorators(array(array('HtmlTag', array('tag' => 'p'))));
        $submit->setAttrib('class', 'submitButton');
		$submit->setIgnore(true);
		
		
		
		$this->addElement($makeId);
		$this->addElement($makeName);
		$this->addElement($makeDes);
		//$this->addElement($img);
		$this->addElement($oldIcon);
		$this->addElement($makeIcon);
		$this->addElement($submit);

    }


}

