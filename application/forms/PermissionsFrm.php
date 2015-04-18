<?php

class Application_Form_PermissionsFrm extends Zend_Form
{
	
	private $roleId;
	private $traCls;
	private $db;
	private $selectedRoleId;
	
	public function init(){}
	
	public function setPermissions($roleid , $sroleId){
	
		$this->roleId 				  = $roleid;
		$this->selectedRoleId = $sroleId;
		$this->db = Zend_Registry::get('database');
	
		$this->traCls	=  Zend_Controller_Action_HelperBroker::getStaticHelper('Traverser');
		
	}
	
	
	
	
	public function buildForm(){
		
		
		$this->setMethod('post');
		$this->setEnctype('multipart/form-data');
		$this->setName('permissions');
		$this->setAttrib('id','perm');	
		$this->setDescription("Permissions");
		
		 $this->addElement('hidden', 'permissions', array(
      		'value' => 1
 		));
 		
		$select = $this->db->select()->from("acl_dashboard");
		$stmt 	= $select->query();
		while($row = $stmt->fetchObject()){
				$taskArr 		=  $this->traCls->getTasks($row->details);
				$groupName 	=	$this->traCls->getInfo($row->details ,'title');
				$resource       =  $this->traCls->getInfo($row->details );
				$permStr    	= $this->traCls->loadPermissions( $row->resource , $this->selectedRoleId );
				$permArr       =  Zend_Json::decode($permStr);
							
				foreach($taskArr as $key => $val ){
					    $element = new Zend_Form_Element_MultiCheckbox($key);
						$element->addMultiOptions($val);
						$element->setValue($permArr);
						$name = base64_encode($key .'-'.$resource);
						$element->setName($name);
						$element->setLabel($key);
						$this->addElement($element);
				}
		}
		
 		$submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('class', 'submitButton');
		
		$submit->setIgnore(true);
		$this->addElement($submit);
		
		
	}
	
	function encrypt($string, $key) {
		$enc = "";
		global $iv;
		$enc=mcrypt_cbc (MCRYPT_TripleDES, $key, $string, MCRYPT_ENCRYPT, $iv);
	
	  return base64_encode($enc);
	}

} //$

