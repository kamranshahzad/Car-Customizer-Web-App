<?php

class Application_Form_DealFindFrm extends Zend_Form
{
	
	public function init(){
		
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('finddeal');
		$this->setAttrib('id','finddeal');	
		$this->setDescription("Find Deal Form");
		
		
			  
		$ref = new Zend_Form_Element_Text('ref');
		$ref->setLabel('Deal Reffernce No: ');		
		$ref->setRequired(true);
		$ref->addErrorMessage('The Deal Reffernce no is required!');
		$ref->addFilter('StringTrim');
		$ref->setDecorators(array(
								'ViewHelper','Description',
								array(array('data'=>'HtmlTag'), array('tag' => 'td')),
								array('Label', array('tag' => 'td')),
								array(array('row'=>'HtmlTag'),array('tag'=>'tr' ))
							));
		$ref->removeDecorator('Errors');

 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setIgnore(true);
		$submit->setDecorators(array(
							   'ViewHelper','Description',
							   array(array('data'=>'HtmlTag'), array('tag' => 'td','colspan'=>'2','align'=>'center')),
							   array(array('row'=>'HtmlTag'),
							   array('tag'=>'tr', 'closeOnly'=>'true'))
			   ));
		$submit->removeDecorator('Errors');

		$this->addElement($ref);
		$this->addElement($submit);
		$this->setDecorators(array(
						'FormElements',
						'FormErrors',
						'Form'
						));
	
	
	
	/*
	    $this->setDecorators(array(

    'FormElements',

    new Zend_Form_Decorator_FormErrors(array(

    'ignoreSubForms'=>true,

    'markupElementLabelEnd'=> '</b>',

    'markupElementLabelStart'=> '<b>',

    'markupListEnd' => '</div>',

    'markupListItemEnd'=>'</span>',

    'markupListItemStart'=>'<span>',

    'markupListStart'=>'<div'
    )),
    'Form'
    ));
		*/	
	}
	
}  //$
