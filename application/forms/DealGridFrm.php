<?php

class Application_Form_DealGridFrm extends Zend_Form
{


	public function init(){}
	
	public function buildForm(){
		
		$arr = array(1=>'Pending', 2=>'Fanlized' , 3=>'Complted');
		
		
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('dealgrid');
		$this->setAttrib('id','dealgrid');	
		$this->setDescription("Deal Grid Form");
		
		
		for($p = 0; $p < 10; $p++){
			
			$dealId = new Zend_Form_Element_Hidden('dealId'.$p);
			$dealId->addFilter('StringTrim');
			$dealId->setDecorators( $this->elementDecorators);
			
			$note = new Application_Form_Element_Note('test'.$p,array('value' => 'Text'));
			$note->setDecorators( array('ViewHelper',array('HtmlTag',array('tag'=>'div','style'=>'width:100px;float:left;'))) );
			
			$status = new Zend_Form_Element_Select('status'.$p , array('onchange'=>'sumbitMe(this.value);'));
			$status->setMultiOptions(array(1 => 'Salesman', 2 => 'Accountant'));
			$status->setDecorators(array('ViewHelper',array('HtmlTag',array('tag'=>'div','style'=>'width:150px;float:left;'))) );
			
			$end = new Application_Form_Element_Note('end'.$p,array('value' => ''));
			$end->setDecorators( array('ViewHelper',array('HtmlTag',array('tag'=>'div','style'=>'clear:both;'))) );
			
			$this->addElement($note);
			$this->addElement($status);
			$this->addElement($end);
			
		}
		
		
	}
	
	//public $elementDecorators = array('ViewHelper',array('HtmlTag',array('tag'=>'div','style'=>'width:50%;;float:left;')));
	public $elementDecorators = array('ViewHelper',array('HtmlTag',array('tag'=>'div','style'=>'width:50%;float:left;')));
	
} //$


