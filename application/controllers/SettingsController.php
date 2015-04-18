<?php

class SettingsController extends Zend_Controller_Action {
	
	public $dashInfoArr = array
				('name'=>'settings' ,
				'title'=>'Settings',
				'options'=> array			
				(
					'listvariables' => array('title'=>'System Variables' , 'icon'=>'user-icon.png'),
					'listemailtemplate' => array('title'=>'Email Templates' , 'icon'=>'email-icon.png'),
					'listbackground' => array('title'=>'Canves Backgrounds' , 'icon'=>'background-icon.png'),
					'listcoordinate' => array('title'=>'Canves Coordinates' , 'icon'=>'coordinates-icon.png'),
				),
				'tasks'=> array(
					'Variables' => array('listvariables'=>'Display Variables' ,'addvariable'=>'Add Variable','modifyvariable'=>'Modify Variable','removevariable'=>'Remove Variable'),
					'Email Templates' => array('listemailtemplate'=>'Display Email Templates' ,'modifyemailtemplate'=>'Modify Email Templates'),
					'Canves Backgrounds' => array('listbackground'=>'Display Backgrounds' ,'createbackground'=>'Add Background','modifybackground'=>'Modify Background','removebackground'=>'Remove Background'),
					'Canves Coordinates' => array('listcoordinate'=>'Display Canves Coordinates' ,'modifycoordinate'=>'Modify Coordinates')
				)
			);
	
						  
	public 	$roleId;
	public 	$role;
	public 	$controllerPerms;
	private $urls;
								
    public function init() {
		$this->_helper->layout()->setLayout('admin_forms_layout');
		
		$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
      	$this->roleId 	= strtolower($identity['roleId']);
		$this->role 	= strtolower($identity['role']);
		
		$this->urls = new $this->_helper->urls();
		
		// load current controllers permissions
		$helperObj 				= new $this->_helper->permissions();
		$this->controllerPerms	= Zend_Json::decode($helperObj->loadControllerPermissions($this->roleId , 'settings')); 
    }

	
	
	
	/*	Variables  */
	public function listvariablesAction(){
		$output = '';
		$mapObj = new Application_Model_Mapper_VariableMapper();
		$obj 	= $mapObj->fetchAll();
		
		/*
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		*/					  
							  
		if(in_array( 'addvariable' , $this->controllerPerms)){
			$this->view->addOption = '<a href="addvariable" class="hyperlinkBtn Fr">Create Variable</a>';	
		}
		
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="30%" class="contactDeptHeading"><strong>Variable</strong></td>
                    <td width="50%" class="contactDeptHeading"><strong>Value</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		
		if(count($obj) > 0){
			foreach($obj as $p){
				$output .= '<tr>';
				$output .= '<td class="userTblTd">'.$p->getVarName().'</td>';
				$output .= '<td class="userTblTd">'.substr($p->getVarValue(),0,50).'</td>';
				$output .= '<td class="userTblTd" colspan="2">
							<a href="modifyvariable/name/'.$p->getVarName().'">modify</a> | 
							<a href="removevariable/name/'.$p->getVarName().'">delete</a>
							</td>';	
				$output .= '</tr>';
			}	
		}
		$output .= '</table>';
		
		$this->view->variableGrid = $output;
	}
	
	
	public function modifyvariableAction(){
		
		/*
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		*/
		$name = $this->getRequest()->getParam('name'); 	
		
		$request = $this->getRequest();
        $form = new Application_Form_VarFrm();
		$mapObj = new Application_Model_Mapper_VariableMapper();
		$data = $mapObj->findByKey($name);
		$form->varName->setValue($data->getVarName());
		$form->varValue->setValue($data->getVarValue());
		
        if ($request->isPost() && $form->isValid($request->getPost())) {	
			$obj = new Application_Model_Variable($form->getValues());
			$mapObj->save($obj , true);
           	return $this->_helper->redirector('listvariables');
        }
        $form->submit->setLabel('Modify Variable');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New Variable added successfully!....');
		$this->view->messages = $this->_helper->flashMessenger->getMessages();
        $this->view->form = $form;
		
		
	}
	
	public function addvariableAction(){
		/*
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		*/
							  
		$request = $this->getRequest();
        $form = new Application_Form_VarFrm();
		
        if ($request->isPost() && $form->isValid($request->getPost())) {	
			$obj = new Application_Model_Variable($form->getValues());
			$mapObj = new Application_Model_Mapper_VariableMapper();
			$mapObj->save($obj);
           	return $this->_helper->redirector('listvariables');
        }
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New Variable added successfully!....');
		$this->view->messages = $this->_helper->flashMessenger->getMessages();
        $form->submit->setLabel('Add Variable');
		$this->view->form = $form;
	}
	
	
	public function removevariableAction(){
		$name = $this->getRequest()->getParam('name'); 	
		$mapObj = new Application_Model_Mapper_VariableMapper();
		$mapObj->delete($name);
		return $this->_helper->redirector('listvariables');
	}
	
	
	/* _Emails */
	public function listemailtemplateAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' ,  'current'=>'List Email Templates'));
		

		
		$map  = new Application_Model_Mapper_VariableMapper();
		$data = $map->findByType('mail'); 
		$helpObj = new $this->_helper->grids();
		$this->view->templateGrid = $helpObj->listEmailTemplatesGrid($data);
	}
	
	public function modifyemailtemplateAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'settings/listemailtemplate'=>'List Email Templates', 'current'=>'Modify Template'));
		
		$name = $this->getRequest()->getParam('vid'); 	
		
		$request = $this->getRequest();
        $form = new Application_Form_EmailTxtFrm();
		$mapObj = new Application_Model_Mapper_VariableMapper();
		$data = $mapObj->findByKey($name);
		$form->varName->setValue($data->getVarName());
		$form->varValue->setValue($data->getVarValue());
		
		
        if ($request->isPost() && $form->isValid($request->getPost())) {	
			$obj = new Application_Model_Variable($form->getValues());
			$mapObj->save($obj , true);
           	//return $this->_helper->redirector('listemailtemplate');
        }
        $form->submit->setLabel('Modify Text');
        $this->view->form = $form;
		
	}
	
	
	/* _Backgrounds */
	public function listbackgroundAction(){
		
		/*
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		*/
		
		if(in_array( 'createbackground' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createbackground" class="hyperlinkBtn Fr">Create Background</a>';	
		}
		

		$helpObj = new $this->_helper->grids();
		$this->view->bgGrid = $helpObj->backgroundsGrid();		
	}
	
	public function createbackgroundAction(){
		
	}
	
	public function modifybackgroundAction(){
		
	}
	
	public function removebackgroundAction(){
		
	}
	
	
	/*  _Coordinates */
	public function listcoordinateAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Canves Coordinates'));
		
		$request = $this->getRequest();
        $form = new Application_Form_CoordinateFrm();
		
		/*
		$mapObj = new Application_Model_Mapper_VariableMapper();
		$data = $mapObj->findByKey($name);
		$form->varName->setValue($data->getVarName());
		$form->varValue->setValue($data->getVarValue());
		*/
		
        if ($request->isPost() && $form->isValid($request->getPost())) {	
			//$obj = new Application_Model_Variable($form->getValues());
			//$mapObj->save($obj , true);
           	//return $this->_helper->redirector('listemailtemplate');
        }
        $form->submit->setLabel('Modify Text');
        $this->view->form = $form;
		
		
		$this->view->coordinatesGrid = "Canves Coordinates";
	}
	
	public function modifycoordinateAction(){
		
	}
	
	
	
	

}  // $class