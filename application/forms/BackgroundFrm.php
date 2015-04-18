<?php

class Application_Form_BackgroundsFrm extends Zend_Form
{
	public function init()
    {
        $this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('bg');
		$this->setAttrib('id','bg');
		$this->setDescription("BG Form");
				
 		$backGroundId = new Zend_Form_Element_Hidden('backGroundId');
		$backGroundId->addFilter('StringTrim');
		$backGroundId->removeDecorator('label');
		$backGroundId->removeDecorator('HtmlTag');

                $backGroundImageHid = new Zend_Form_Element_Hidden('backGroundImageHid');
		$backGroundImageHid->addFilter('StringTrim');
		$backGroundImageHid->removeDecorator('label');
		$backGroundImageHid->removeDecorator('HtmlTag');
        
		$backGroundName = new Zend_Form_Element_Text('backGroundName');
		$backGroundName->setLabel('Background Name :');
		$backGroundName->setRequired(true);
		$backGroundName->addErrorMessage('The Background Name is required!');
		$backGroundName->addFilter('StringTrim');
		$backGroundName->setAttrib('class','input1');
		$backGroundName->addDecorators(array(array('Errors', array('class'=>'red15')), array('HtmlTag', array('tag' => 'p')), array('Label', array('tag' => 'p', 'class'=>'blck15' ))));
		
		$backGroundImage = new Zend_Form_Element_File('backGroundImage');
		$backGroundImage->setLabel('Background Image :');
                $backGroundImage->setDestination('assets/backgrounds')
						->addValidator('Count', false, 1)
							->addValidator('Size', false, '5MB')
								->addValidator('Extension', false, 'jpg,png,gif');

		$backGroundImage->setRequired(true);
		$backGroundImage->addErrorMessage('The Background Image is required!');
		$backGroundImage->addFilter('StringTrim');
		$backGroundImage->setAttrib('class','input1');
		$backGroundImage->addDecorators(array(array('Errors', array('class'=>'red15')), array('HtmlTag', array('tag' => 'p')), array('Label', array('tag' => 'p', 'class'=>'blck15' ))));
        

 		$submit = new Zend_Form_Element_Submit('submit');		
		$submit->removeDecorator('DtDdWrapper');
		$submit->addDecorators(array(array('HtmlTag', array('tag' => 'p'))));
                $submit->setAttrib('class', 'submitButton');
		$submit->setIgnore(true);
		
		$this->addElement($backGroundId);
                $this->addElement($backGroundImageHid);
		$this->addElement($backGroundName);
		$this->addElement($backGroundImage);
		$this->addElement($submit);

    }


}

