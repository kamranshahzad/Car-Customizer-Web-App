<?php

class CmsController extends Zend_Controller_Action {
					
	public $dashInfoArr = array
						('name'=>'cms' ,
						'title'=>'Content Management',
						'options'=> array			
						(
							'listpages' => array('title'=>'Content Pages' , 'icon'=>'content-management.png'),
							'listnews' => array('title'=>'News & Updates' , 'icon'=>'news-icons.png')
						),
						'tasks'=> array(
							'CMS' => array('listpages'=>'Display Content Pages','modifypages'=>'Modify Pages' ),
							'NEWS/UPDATES' => array('listnews'=>'Display Content News','createnews'=>'Create News','modifynews'=>'Modify News' , 'removenews'=>'Remove News' , 'statusnews'=>'Enable & Disable News')
						)
	);
	
					  
	public 	$roleId;
	public 	$role;
	public 	$controllerPerms;
	
					
    public function init() {
        $this->_helper->layout()->setLayout('admin_forms_layout');
		
		$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
      	$this->roleId 	= strtolower($identity['roleId']);
		$this->role 	= strtolower($identity['role']);
		
		$this->basePath = Zend_Registry::get('publicPath');
		
		// load current controllers permissions
		$helperObj 				= new $this->_helper->permissions();
		$this->controllerPerms	= Zend_Json::decode($helperObj->loadControllerPermissions($this->roleId , 'cms')); 
    }
	
	public function listpagesAction(){
		
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$mapObj = new Application_Model_Mapper_VariableMapper();
		$obj 	= $mapObj->fetchAll(true);
		
		
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="30%" class="contactDeptHeading"><strong>Page Name</strong></td>
                    <td width="50%" class="contactDeptHeading"><strong>Body Text</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		
		if(count($obj) > 0){
			foreach($obj as $p){
				$output .= '<tr>';
				$output .= '<td class="userTblTd">'.$p->getVarName().'</td>';
				$output .= '<td class="userTblTd">'.substr($p->getVarValue(),0,50).'</td>';
				$output .= '<td class="userTblTd" >
							<a href="modifypages/name/'.$p->getVarName().'">modify</a>
							</td>';	
				$output .= '</tr>';
			}	
		}
		$output .= '</table>';		
		$this->view->cmsGrid = $output;
	}
	
	public function modifypagesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$name = $this->getRequest()->getParam('name'); 	
		
		$request = $this->getRequest();
        $form = new Application_Form_CmsFrm();
		$mapObj = new Application_Model_Mapper_VariableMapper();
		$data = $mapObj->findByKey($name);
		$form->varName->setValue($data->getVarName());
		$form->varValue->setValue($data->getVarValue());
		
        if ($request->isPost() && $form->isValid($request->getPost())) {	
			$obj = new Application_Model_Variable($form->getValues());
			$mapObj->save($obj , true);
           	return $this->_helper->redirector('listpages');
        }
        $form->submit->setLabel('Modify Page');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New Variable added successfully!....');
		$this->view->messages = $this->_helper->flashMessenger->getMessages();
        $this->view->form = $form;
	}
	
	
	
	/* New & Updates  */
	
	public function listnewsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		if(in_array( 'createnews' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createnews" class="hyperlinkBtn Fr">Add News</a>';	
		}
		
		
		$mapObj = new Application_Model_Mapper_NewsMapper();
		$data = $mapObj->fetchAll();
		$helpObj = new $this->_helper->grids();		
		
		$this->view->newsGrid = $helpObj->newsGrid($data , $this->controllerPerms );
	}
	
	public function createnewsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$request = $this->getRequest();
        $form = new Application_Form_NewsFrm();
		
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_News($form->getValues());
			$mapObj = new Application_Model_Mapper_NewsMapper();
			$mapObj->save($obj);
			return $this->_helper->redirector('listnews');
        }
        $form->submit->setLabel('Add News');
        $this->view->form = $form;
	}
	
	public function modifynewsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$nid = $this->getRequest()->getParam('nid');
		$request = $this->getRequest();
		$mapObj = new Application_Model_Mapper_NewsMapper();
        $form = new Application_Form_NewsFrm();
		$data = $mapObj->fetchById($nid);
		
		$form->nid->setValue($data->getNid());
		$form->title->setValue($data->getTitle());
		$form->date->setValue($data->getDate());
		$form->des->setValue($data->getDes());
		$form->status->setValue($data->getStatus());
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_News($form->getValues());
			$mapObj->save($obj);
			return $this->_helper->redirector('listnews');
        }
        $form->submit->setLabel('Modify News');
        $this->view->form = $form;
	}
	
	public function removenewsAction(){
		//
	}
	
	public function statusnewsAction(){
		//
	}

}  // $class