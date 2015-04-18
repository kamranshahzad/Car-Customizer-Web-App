<?php

class Application_Form_DealFrm extends Zend_Form
{
	public function init()
    {
        $this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('deal');
		$this->setAttrib('id','deal');	
		$this->setDescription("Deal Form");
		
		
        $referenceNo = new Zend_Form_Element_Text('referenceNo');
		//$referenceNo->setLabel('Username');
		$referenceNo->removeDecorator('label');
		$referenceNo->removeDecorator('HtmlTag');  
		$referenceNo->removeDecorator('Errors');                
		$referenceNo->setRequired(true);
		$referenceNo->addErrorMessage('The Reference Number is required!');
		$referenceNo->addFilter('StringTrim');
		$referenceNo->setAttrib('class','FormTextField');
		
		
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setValue('Submit');
		$submit->setLabel('');
		$submit->removeDecorator('label');
		$submit->removeDecorator('HtmlTag');
                $submit->removeDecorator('DtDdWrapper');
                $submit->setAttrib('class', 'dealFrmButton');
		$submit->setIgnore(true);
		
		$this->addElement($referenceNo);
		
		$this->addElement($submit);
    }


}

