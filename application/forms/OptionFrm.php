<?php

class Application_Form_OptionFrm extends Zend_Form
{
	public function init()
    {
        $this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('option');
		$this->setAttrib('id','option');	
		$this->setDescription("Option Form");
		
 		$extcolor = new Zend_Form_Element_Hidden('extcolor');
		$extcolor->removeDecorator('label');
		$extcolor->removeDecorator('HtmlTag');  
		$extcolor->removeDecorator('Errors');    
		$extcolor->addFilter('StringTrim');
		
		$intcolor = new Zend_Form_Element_Hidden('intcolor');
		$intcolor->removeDecorator('label');
		$intcolor->removeDecorator('HtmlTag');  
		$intcolor->removeDecorator('Errors');    
		$intcolor->addFilter('StringTrim');
		
		$dealType = new Zend_Form_Element_Hidden('dealType');
		$dealType->removeDecorator('label');
		$dealType->removeDecorator('HtmlTag');  
		$dealType->removeDecorator('Errors');    
		$dealType->addFilter('StringTrim');
		
                $referenceNo = new Zend_Form_Element_Text('refNo');
		//$referenceNo->setLabel('Username');
		$referenceNo->removeDecorator('label');
		$referenceNo->removeDecorator('HtmlTag');  
		$referenceNo->removeDecorator('Errors');                
		$referenceNo->setRequired(true);
		$referenceNo->addErrorMessage('The Reference Number is required!');
		$referenceNo->addFilter('StringTrim');
		$referenceNo->setAttrib('class','FormTextField');
		
		$salesPersonFirstName = new Zend_Form_Element_Text('salesPersonFirstName');
		//$salesPersonFirstName->setLabel('salesPersonFirstName');
		$salesPersonFirstName->removeDecorator('label');
		$salesPersonFirstName->removeDecorator('HtmlTag');  
		$salesPersonFirstName->removeDecorator('Errors');    
		$salesPersonFirstName->setRequired(true);
		$salesPersonFirstName->addErrorMessage('The Sales Person First Name is required!');
		$salesPersonFirstName->addFilter('StringTrim');
		$salesPersonFirstName->setAttrib('class','FormTextField');
		
 		
		$salesPersonLastName = new Zend_Form_Element_Text('salesPersonLastName');
		//$salesPersonLastName->setLabel('salesPersonLastName');
		$salesPersonLastName->removeDecorator('label');
		$salesPersonLastName->removeDecorator('HtmlTag');  
		$salesPersonLastName->removeDecorator('Errors');    
		$salesPersonLastName->setRequired(true);
		$salesPersonLastName->addErrorMessage('The Sales Person Last Name is required!');
		$salesPersonLastName->addFilter('StringTrim');
		$salesPersonLastName->setAttrib('class','FormTextField');  
		
		
		$customerFirstName = new Zend_Form_Element_Text('customerFirstName');
		//$customerFirstName->setLabel('customerFirstName');
		$customerFirstName->removeDecorator('label');
		$customerFirstName->removeDecorator('HtmlTag');  
		$customerFirstName->removeDecorator('Errors');    
		//$customerFirstName->setRequired(true);
		//$customerFirstName->addErrorMessage('The Customer First Name is required!');
		$customerFirstName->addFilter('StringTrim');
		$customerFirstName->setAttrib('class','FormTextField');  
		
        $customerLastName = new Zend_Form_Element_Text('customerLastName');
		//$customerLastName->setLabel('customerLastName');
		$customerLastName->removeDecorator('label');
		$customerLastName->removeDecorator('HtmlTag');  
		$customerLastName->removeDecorator('Errors');    
		//$customerLastName->setRequired(true);
		//$customerLastName->addErrorMessage('The Customer Last Name is required!');
		$customerLastName->addFilter('StringTrim');
		$customerLastName->setAttrib('class','FormTextField');  
		
		
		$customerEmail = new Zend_Form_Element_Text('customerEmail');
		//$customerEmail->setLabel('customerEmail');
		$customerEmail->removeDecorator('label');
		$customerEmail->removeDecorator('HtmlTag');  
		$customerEmail->removeDecorator('Errors');    
		//$customerEmail->setRequired(true);
		//$customerEmail->addErrorMessage('The Customer Email is required!');
		$customerEmail->addFilter('StringTrim');
		$customerEmail->setAttrib('class','FormTextField'); 
		
		
		$customerPhone = new Zend_Form_Element_Text('customerPhone');
		//$customerPhone->setLabel('customerPhone');
		$customerPhone->removeDecorator('label');
		$customerPhone->removeDecorator('HtmlTag');  
		$customerPhone->removeDecorator('Errors');    
		//$customerPhone->setRequired(true);
		//$customerPhone->addErrorMessage('The Customer Phone is required!');
		$customerPhone->addFilter('StringTrim');
		$customerPhone->setAttrib('class','FormTextField'); 
		
 		$submit = new Zend_Form_Element_Submit('submit');
                $submit->setValue('Submit');
		$submit->removeDecorator('label');
		$submit->removeDecorator('HtmlTag');
                $submit->removeDecorator('DtDdWrapper');
                $submit->setAttrib('style', 'background-color:#C00; font-family:Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; color:#FFFFFF; height:25px;');
		$submit->setIgnore(true);
		
		$this->addElement($extcolor);
		$this->addElement($intcolor);
		$this->addElement($dealType);
		$this->addElement($referenceNo);
		$this->addElement($salesPersonFirstName);
		$this->addElement($salesPersonLastName);
		$this->addElement($customerFirstName);
		$this->addElement($customerLastName);
		$this->addElement($customerEmail);
		$this->addElement($customerPhone);
		
		$this->addElement($submit);
    }


}

