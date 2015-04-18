<?php

class VehiclesController extends Zend_Controller_Action {
	
	public $dashInfoArr = array
				('name'=>'vehicles' ,
				'title'=>'Vehicle Management',
				'options'=> array			
				(
					'listvehicles' => array('title'=>'Vehicles' , 'icon'=>'model_year_icon.png'),
					'listmakes' => array('title'=>'Makes' , 'icon'=>'make.png'),
					'listmakeyears' => array('title'=>'Years' , 'icon'=>'years-icon.png'),
					'listmodels'	=> array('title'=>'Vehicle Models' , 'icon'=>'models.png'),
					'listmodeltrims'	=> array('title'=>'Model Trims' , 'icon'=>'model_year_icon.png'),
					'listexteriorcolor'	=> array('title'=>'Exterior Color' , 'icon'=>'partlist_icon.png'),
					'listinteriorcolor'	=> array('title'=>'Interior Color' , 'icon'=>'partlist_icon.png'),
					'listparttypes'	=> array('title'=>'Part Types' , 'icon'=>'vehicle_sale.png'),
					'listpartcategories'	=> array('title'=>'Part Categories' , 'icon'=>'user-settings.png'),
					'listwheelsize'	=> array('title'=>'Wheel Sizes' , 'icon'=>'wheel-icon.png'),
					'listwheelcategories'	=> array('title'=>'Wheel Categories' , 'icon'=>'wheel-cat-icon.png'),
					'listpartmanufacturer'	=> array('title'=>'Part Manufactuers' , 'icon'=>'manufacturer.png'),
					'listparts'	=> array('title'=>'Vehicle Parts' , 'icon'=>'vehicle-accessories.png'),
				),
				'tasks'=> array(
					'Vehicles' => array('listvehicles'=>'Display Vehicles','createvehicles'=>'Add vehicles','modifyvehicles'=>'Modify Vehciles','removevehicles'=>'Remove Vehciles'),
					'Makes' => array('listmakes'=>'Display Makes','createmakes'=>'Add Makes','modifymakes'=>'Modify Makes' ,'removemakes'=>'Remove Makes'),
					'Years' => array('listmakeyears'=>'List Years','createmakeyears'=>'Add Model Year','modifymakeyears'=>'Modify Model Year','removemakeyears'=>'Remove Model Year'),
					'Models' => array('listmodels'=>'List Models','createmodels'=>'Add Models','modifymodels'=>'Modifu Models','removemodels'=>'Remove Models'),
					'Trims' => array('listmodeltrims'=>'List Trims','createmodeltrims'=>'Add Model Trims','modifymodeltrims'=>'Modify Model Trims','removemodeltrims'=>'Remove Model Trims'),
					'Interior Color' => array('listinteriorcolor'=>'List Interior Colors','createinteriorcolor'=>'Add Interior Color','modifyinteriorcolor'=>'Modify Interior Color','removeinteriorcolor'=>'Remove Interior Color'),
					'Exterior Color' => array('listexteriorcolor'=>'List Exterior Colors','createexteriorcolor'=>'Create Exterior Colors','modifyexteriorcolor'=>'Modify Exterior Colors','removeexteriorcolor'=>'Remove Exteior Colors'),
					'Part Type' => array('listparttypes'=>'Display Part Types','modifyparttypes'=>'Modify Part Type'),
					'Part Categories' => array('listpartcategories'=>'List Part Categories' ,'createpartcategories'=>'Add Part Categories' ,'modifypartcategories'=>'Modify Part Categories' ,'removepartcategories'=>'Remove Part Categories' ,'statuspartcategories'=>'Enable/Disable Part Categories'),
					'Wheel Sizes' => array('listwheelsize'=>'List Wheel Sizes' ,'createwheelsize'=>'Create Wheel Sizes' ,'modifywheelsize'=>'Modify Wheel Sizes','removewheelsize'=>'Remove Wheel Sizes','statuswheelsize'=>'Enable/Disable Wheel Sizes'),
					'Wheel Categories' => array('listwheelcategories'=>'List Wheel Categories' ,'createwheelcategories'=>'Add Wheel Categories' ,'modifywheelcategories'=>'Modify Wheel Categories','removewheelcategories'=>'Remove Wheel Categories','statuswheelcategories'=>'Enable/Disable Wheel Categories'),
					'Part Manufacturers' => array('listpartmanufacturer'=>'List Manufacturer' ,'createpartmanufacturer'=>'Add Part Manufacturer' , 'modifypartmanufacturer'=>'Modify Part Manufacturer','removepartmanufacturer'=>'Remove Part Manufacturer' , 'statuspartmanufacturer'=>'Enable/Disable Part Manufacturers'),
					'Parts' => array('listparts'=>'List Parts' ,'createparts'=>'Add Parts' , 'modifyparts'=>'Modify Parts' , 'removeparts'=>'Remove Parts', 'statusparts'=>'Enable/Disable Parts')
				)
			);
							  				
	private $roleId;
	private $role;
	private $uid;
	private $controllerPerms;
	private $db;
	private $basePath;
	
					
    public function init() {
		$this->_helper->layout()->setLayout('admin_forms_layout');
		$auth = Zend_Auth::getInstance();
	  	$identity = $auth->getIdentity();
      	$this->roleId 	= strtolower($identity['roleId']);
		$this->role 	= strtolower($identity['role']);
		$this->uid      = strtolower($identity['uid']);
		$this->db = Zend_Registry::get('database');
		
		$this->basePath = Zend_Registry::get('publicPath');
		
		// load current controllers permissions
		$helperObj 				= new $this->_helper->permissions();
		$this->controllerPerms	= Zend_Json::decode($helperObj->loadControllerPermissions($this->roleId , 'vehicles'));
	}
	
	
	
	/* #Vehicles */
	public function listvehiclesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createvehicles' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createvehicles" class="hyperlinkBtn Fr">Add Vehicle</a>';	
		}
		
		
		$this->view->vehicleGrid = 'Grid';
	}
	public function createvehiclesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function modifyvehiclesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function removevehiclesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	
	
	
	/* #Make */
	public function listmakesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createmakes' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createmakes" class="hyperlinkBtn Fr">Add Make</a>';	
		}
		
		$mapObj = new Application_Model_Mapper_MakeMapper();
		$data = $mapObj->fetchAll();
		$helpObj = new $this->_helper->grids();
		$this->view->makeGrid = $helpObj->makeGrid($data , $this->controllerPerms );	
	}
	public function createmakesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$request = $this->getRequest();
        $form = new Application_Form_MakeFrm();
		$form->makeIcon->setRequired(true);
		
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$frmData = $form->getValues();
			$originalFilename = pathinfo($form->makeIcon->getFileName());
    		$newFilename = 'file-' . uniqid() . '.' . $originalFilename['extension'];
			$form->makeIcon->addFilter('Rename', $newFilename);
			$frmData['makeIcon'] = $newFilename;
			
			if (!$form->makeIcon->receive()) {
				print "Upload error";
			}else{
		   		$obj = new Application_Model_Make($frmData);
				$mapObj = new Application_Model_Mapper_MakeMapper();
				$mapObj->save($obj);
				return $this->_helper->redirector('listmakes');
			}
			
        }
        $form->submit->setLabel('Add Make');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New make added successfully!....');
        $this->view->form = $form;
	}
	public function modifymakesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$mid = $this->getRequest()->getParam('mid'); 
		$request = $this->getRequest();
		$mapObj = new Application_Model_Mapper_MakeMapper();
        $form = new Application_Form_MakeFrm();
		$data = $mapObj->fetchById($mid);
		
		
		$form->makeId->setValue($data->getMakeId());
		$form->makeName->setValue($data->getMakeName());
		$form->makeDes->setValue($data->getMakeDes());
		$form->oldIcon->setValue($data->getMakeIcon());
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$frmData = $form->getValues();
			
			if($frmData['makeIcon'] == ''){
				$frmData['makeIcon'] = $data->getMakeIcon();
				$obj = new Application_Model_Make($frmData);
				$mapObj->save($obj);
				return $this->_helper->redirector('listmakes');	
			}else{
				$originalFilename = pathinfo($form->makeIcon->getFileName());
				$newFilename = 'file-' . uniqid() . '.' . $originalFilename['extension'];
				$form->makeIcon->addFilter('Rename', $newFilename);
				$frmData['makeIcon'] = $newFilename;
				
				if (!$form->makeIcon->receive()) {
					print "Upload error";
				}else{
					$obj = new Application_Model_Make($frmData);
					$mapObj->save($obj);
					return $this->_helper->redirector('listmakes');
				}	
			}
        }
        $form->submit->setLabel('Modify Make');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New make added successfully!....');
		$this->view->messages = $this->_helper->flashMessenger->getMessages();
        $this->view->form = $form;
		
	}
	public function removemakesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$mid = $this->getRequest()->getParam('mid');
		$mapObj = new Application_Model_Mapper_MakeMapper();
		$mapObj->delete($mid);
		
		$flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('Selected make removed successfully!....');
		$this->view->messages = $this->_helper->flashMessenger->getMessages();
		return $this->_helper->redirector('listmakes');
	}
	
	
	
	/* #Year */
	public function listmakeyearsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createmakeyears' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createmakeyears" class="hyperlinkBtn Fr">Add Year</a>';	
		}
		
		$mapObj = new Application_Model_Mapper_YearMapper();
		$data = $mapObj->fetchAll();
		$helpObj = new $this->_helper->grids();
		$this->view->yearGrid = $helpObj->yearsGrid($data , $this->controllerPerms );
	}
	public function createmakeyearsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$request = $this->getRequest();
        $form = new Application_Form_YearFrm();
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_Year($form->getValues());
			$mapObj = new Application_Model_Mapper_YearMapper();
			$mapObj->save($obj);
           	return $this->_helper->redirector('listmakeyears');
        }
        $form->submit->setLabel('Add Year');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New Year added successfully!....');
        $this->view->form = $form;
	}
	public function modifymakeyearsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$yid = $this->getRequest()->getParam('yid'); 	
		$request = $this->getRequest();
		$mapObj = new Application_Model_Mapper_YearMapper();
        $form = new Application_Form_YearFrm();
		$data = $mapObj->findById($yid);
		
		$form->yearId->setValue($data->getYearId());
		$form->year->setValue($data->getYear());
		$form->des->setValue($data->getDes());
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_Year($form->getValues());	
			$mapObj->save($obj);
           	return $this->_helper->redirector('listmakeyears');
        }
        $form->submit->setLabel('Modify Year');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New Year added successfully!....');
        $this->view->form = $form;
	}
	public function removemakeyearsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$yid = $this->getRequest()->getParam('yid'); 
		$mapObj = new Application_Model_Mapper_YearMapper();
		$mapObj->delete($yid);
		
		return $this->_helper->redirector('listmakeyears');
	}
	
	
	/* #Models */
	public function listmodelsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createmodels' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createmodels" class="hyperlinkBtn Fr">Add Model</a>';	
		}
		
		$mapObj = new Application_Model_Mapper_ModelMapper();
		$data = $mapObj->fetchAll();
		$helpObj = new $this->_helper->grids();	
		
		$this->view->modelGrid = $helpObj->modelGrid($data , $this->controllerPerms );	
	}
	

	public function createmodelsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function modifymodelsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function removemodelsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	
	
	/* #Trims */
	public function listmodeltrimsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createmodels' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createmodeltrims" class="hyperlinkBtn Fr">Add Model Trim</a>';	
		}
		
		$mapObj = new Application_Model_Mapper_TrimsMapper();
		$data = $mapObj->fetchAll();
		$helpObj = new $this->_helper->grids();	
		
		$this->view->trimGrid = $helpObj->trimGrid($data , $this->controllerPerms );
	}
	public function createmodeltrimsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function modifymodeltrimsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function removemodeltrimsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	
	
	/* #Exterior Colors  */
	public function listexteriorcolorAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createexteriorcolor' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createexteriorcolor" class="hyperlinkBtn Fr">Add Exterior Color</a>';	
		}
		
		$mapObj = new Application_Model_Mapper_ExteriorColorMapper();
		$data = $mapObj->fetchAll();
		$helpObj = new $this->_helper->grids();	

		$this->view->colorGrid = $helpObj->exteriorColorGrid($data , $this->controllerPerms );	
	}
	public function createexteriorcolorAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function modifyexteriorcolorAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function removeexteriorcolorAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	
	
	/* #Interior Colors  */
	public function listinteriorcolorAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createinteriorcolor' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createinteriorcolor" class="hyperlinkBtn Fr">Add Interior Color</a>';	
		}
		
		$mapObj = new Application_Model_Mapper_InteriorColorMapper();
		$data = $mapObj->fetchAll();
		$helpObj = new $this->_helper->grids();	
		
		$this->view->colorGrid = $helpObj->interiorColorGrid($data , $this->controllerPerms );	
	}
	public function createinteriorcolorAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}	
	public function modifyinteriorcolorAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}	
	public function removeinteriorcolorAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';	
	}	
		
	
	
	/* #Part Type */
	public function listparttypesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		//$mapObj = new Application_Model_Mapper_PartTypeMapper();
		//$data = $mapObj->fetchAll();
		$helpObj = new $this->_helper->grids();	
		$this->view->partTypeGrid = $helpObj->partTypesGrid( $this->db ,3 , 2 , $this->controllerPerms );
	}
	public function modifyparttypesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	
	
	
	
	/* #Part Categories */
	public function listpartcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createpartcategories' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createpartcategories" class="hyperlinkBtn Fr">Add Part Category</a>';	
		}
		
		$helpObj = new $this->_helper->grids();	
		$this->view->partCategoryGrid = $helpObj->partCategoriesGrid();
	}
	public function createpartcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function modifypartcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function removepartcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function statuspartcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}   // enabled/ disabled
	
	
	
	/* #Wheel Sizes */
	public function listwheelsizeAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createwheelsize' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createwheelsize" class="hyperlinkBtn Fr">Add Wheel Size</a>';	
		}
		
		
		$helpObj = new $this->_helper->grids();	
		$this->view->wheelSizeGrd = $helpObj->wheelSizesGrid();
	}
	public function createwheelsizeAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function modifywheelsizeAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function removewheelsizeAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function statuswheelsizeAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	
	
	
	/* #Wheel Categories */
	public function listwheelcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createwheelcategories' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createwheelcategories" class="hyperlinkBtn Fr">Add Wheel Category</a>';	
		}
		
		
		$helpObj = new $this->_helper->grids();	
		$this->view->wheelCategoryGrid = $helpObj->wheelTypesGrid();
	}
	public function createwheelcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function modifywheelcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function removewheelcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function statuswheelcategoriesAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	
	
	/* #Part Manufacturers */
	public function listpartmanufacturerAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createpartmanufacturer' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createpartmanufacturer" class="hyperlinkBtn Fr">Add Part Manufactuers</a>';	
		}
		
		$mapObj = new Application_Model_Mapper_ManufacturerMapper();
		$helpObj = new $this->_helper->grids();
		$this->view->partManuGrid = $helpObj->manufacturesGrid( $mapObj , $this->db , $this->roleId ,$this->uid, $this->controllerPerms );
	}
	public function createpartmanufacturerAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$request = $this->getRequest();
        $form = new Application_Form_ManufacturerFrm();
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			$obj = new Application_Model_Manufacturer($form->getValues());
			$mapObj = new Application_Model_Mapper_ManufacturerMapper();
			$mapObj->save($obj , $this->db);
           	return $this->_helper->redirector('listpartmanufacturer');
        }
        $form->submit->setLabel('Add Manufacturer');
        $flashMessenger = $this->_helper->FlashMessenger;           
        $flashMessenger->addMessage('New Manufacturer added successfully!....');
        $this->view->form = $form;
	}
	public function modifypartmanufacturerAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		

		$mid = $this->getRequest()->getParam('mid'); 	
		$request = $this->getRequest();
		$mapObj = new Application_Model_Mapper_ManufacturerMapper();
        $form = new Application_Form_ManufacturerFrm();
		
		
		if($this->roleId == 3){ //3
			$data = $mapObj->fetchAllByUserData($this->db , $mid , $this->uid );
			$form->note->setValue($data);
		}else{
			$data = $mapObj->fetchById($mid);
			$form->manId->setValue($data->getManId());
			$form->manName->setValue($data->getManName());
			$form->notes->setValue($data->getNote());
			$form->status->setCheckedValue($data->getStatus());	
		}
		
        if ($request->isPost() && $form->isValid($request->getPost())) {
			if($this->roleId == 3){ //3
				$mapObj->saveUserData($this->db , $form->getValues() , $this->uid , $mid );
			}else{
				//$obj = new Application_Model_Year($form->getValues());	
				//$mapObj->save($obj);
			}
           	return $this->_helper->redirector('listpartmanufacturer');
        }
		if($this->roleId == 3){
        	$form->submit->setLabel('Modify Notes');
		}else{
			$form->submit->setLabel('Modify Manufacturer');
		}
        $this->view->form = $form;
	}
	public function removepartmanufacturerAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		/*
		$yid = $this->getRequest()->getParam('yid'); 
		$mapObj = new Application_Model_Mapper_YearMapper();
		$mapObj->delete($yid);
		
		return $this->_helper->redirector('listmakeyears');
		*/
	}
	public function statuspartmanufacturerAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		
		$mid = $this->getRequest()->getParam('mid'); 
		
		$mapObj = new Application_Model_Mapper_ManufacturerMapper();
		$mapObj->statusUserData($this->db , 2 , $mid);
		return $this->_helper->redirector('listpartmanufacturer');
	}
	
	
	
	/* #Price Modifiers */
	public function listpartsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
		if(in_array( 'createparts' , $this->controllerPerms)){
			$this->view->addOption = '<a href="createparts" class="hyperlinkBtn Fr">Add Part</a>';	
		}
		
		
		$mapObj = new Application_Model_Mapper_PartsMapper();
		$helpObj = new $this->_helper->grids();
		//$this->view->partsGrid = $helpObj->partsGrid( $mapObj , $this->db , $this->roleId ,$this->uid, $this->controllerPerms );
		$this->view->partsGrid = 'listed parts';
	}
	public function createpartsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function modifypartsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function removepartsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	public function statuspartsAction(){
		$this->view->links = '<div class="user-name"><a href="'.$this->basePath.'admin/main/">Dashboard</a></div>
							  <div class="logout"><a href="../admin/logout">Logout</a></div>';
	}
	
	
	
	
	
   

}  // $class