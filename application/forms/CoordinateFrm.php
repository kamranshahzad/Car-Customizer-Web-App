<?php

class Application_Form_CoordinateFrm extends Zend_Form
{
		
	public function init(){
		
		$this->setMethod('post');
		//$this->setAction('');
		$this->setEnctype('multipart/form-data');
		$this->setName('coordinate');
		$this->setAttrib('id','coordinate');	
		$this->setDescription("Coordinate Form");
		
		$a1 = new Zend_Form_Element_Text('a1');
		$a1->setLabel('Small Front View -X');		
		$a1->setRequired(true);
		$a1->addErrorMessage('The value is required!');
		$a1->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$a2 = new Zend_Form_Element_Text('a2');
		$a2->setLabel('Small Front View -Y');		
		$a2->setRequired(true);
		$a2->addErrorMessage('The value is required!');
		$a2->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$b1 = new Zend_Form_Element_Text('b1');
		$b1->setLabel('Small Rear View -X');		
		$b1->setRequired(true);
		$b1->addErrorMessage('The value is required!');
		$b1->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$b2 = new Zend_Form_Element_Text('b2');
		$b2->setLabel('Small Rear View -Y');		
		$b2->setRequired(true);
		$b2->addErrorMessage('The value is required!');
		$b2->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$c1 = new Zend_Form_Element_Text('c1');
		$c1->setLabel('Small Interior View -X');		
		$c1->setRequired(true);
		$c1->addErrorMessage('The value is required!');
		$c1->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$c2 = new Zend_Form_Element_Text('c2');
		$c2->setLabel('Small Interior View -Y');		
		$c2->setRequired(true);
		$c2->addErrorMessage('The value is required!');
		$c2->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$d1 = new Zend_Form_Element_Text('d1');
		$d1->setLabel('Big Front View -X');		
		$d1->setRequired(true);
		$d1->addErrorMessage('The value is required!');
		$d1->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$d2 = new Zend_Form_Element_Text('d2');
		$d2->setLabel('Big Front View -Y');		
		$d2->setRequired(true);
		$d2->addErrorMessage('The value is required!');
		$d2->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$e1 = new Zend_Form_Element_Text('e1');
		$e1->setLabel('Big Rear View -X');		
		$e1->setRequired(true);
		$e1->addErrorMessage('The value is required!');
		$e1->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$e2 = new Zend_Form_Element_Text('e2');
		$e2->setLabel('Big Rear View -Y');		
		$e2->setRequired(true);
		$e2->addErrorMessage('The value is required!');
		$e2->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$f1 = new Zend_Form_Element_Text('f1');
		$f1->setLabel('Big Interior View -X');		
		$f1->setRequired(true);
		$f1->addErrorMessage('The value is required!');
		$f1->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		$f2 = new Zend_Form_Element_Text('f2');
		$f2->setLabel('Big Interior View -Y');		
		$f2->setRequired(true);
		$f2->addErrorMessage('The value is required!');
		$f2->setDecorators(array('ViewHelper','Description','Errors',array(array('data'=>'HtmlTag'), array('tag' => 'td')),array('Label', array('tag' => 'td')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))));
		
		

		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		$submit->setDecorators(array('ViewHelper','Description','Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td','align'=>'center')),array(array('row'=>'HtmlTag'),array('tag'=>'tr'))  ));
		
		$submit->setIgnore(true);
		$this->addElement($a1);
		$this->addElement($a2);
		$this->addElement($b1);
		$this->addElement($b2);
		$this->addElement($c1);
		$this->addElement($c2);
		$this->addElement($d1);
		$this->addElement($d2);
		$this->addElement($e1);
		$this->addElement($e2);
		$this->addElement($f1);
		$this->addElement($f2);
		
		$this->addElement($submit);	
		$this->setDecorators(array('FormElements',array(array('data'=>'HtmlTag'),array('tag'=>'table','class'=>'formTable')),'Form') );
		
	}
	
}
