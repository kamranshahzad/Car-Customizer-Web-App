<?php

class WorkerController extends Zend_Controller_Action {
	
	public $nav_links = '<div class="user-name"> 
						<a href="../admin/main/">Dashboard</a> 
					  </div>
					  <div class="logout">
						<a href="../admin/logout">Logout</a>
					  </div>';
						  
						  
    public function init() {
        /* Initialize action controller here */
		 $this->_helper->layout()->setLayout('admin_forms_layout');
    }

	
	public function prebuildpermissionsAction(){
		$this->view->links = $this->nav_links;
		
		$this->_helper->prebuild();
		$this->view->prebuild = 'Pre-build permissions applied successfully...';
	}
	
	

}  // $class