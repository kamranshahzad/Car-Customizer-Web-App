<?php

class ReportsController extends Zend_Controller_Action {
	
   public $dashInfoArr = array
						('name'=>'reports' ,
						'title'=>'Reports',
						'options'=> array			
						(
							'liststatistices' => array('title'=>'Statistices' , 'icon'=>'stat-report.png'),
							'dealerperformance' => array('title'=>'Dealer Performance' , 'icon'=>'performance-icon.png'),
							'salesperformance' => array('title'=>'Sales Performance' , 'icon'=>'sales-icon.png'),
							'profitablity' => array('title'=>'Profitablity' , 'icon'=>'profit_icon.png'),
							'parts' => array('title'=>'Accessories' , 'icon'=>'parts-icon.png'),
							'modelyears' => array('title'=>'Model/Years' , 'icon'=>'model-year-icon.png'),
							'deals' => array('title'=>'Deals' , 'icon'=>'reporte.png'),
							'vehicles' => array('title'=>'Vehicle' , 'icon'=>'vehicle_sale.png'),
							'users' => array('title'=>'Users' , 'icon'=>'user-reports.png')
						),
						'tasks'=> array(
							'Statistices' => array('liststatistices'=>'View Vehicle Statistices' , 'exportstatistices'=>'Export Statistices Report '),
							'Dealer Performance' => array('dealerperformance'=>'View Dealer Performance Statistices Report' , 'exportdealerperformance'=>'Export Dealer Performance Report '),
							'Sales Performance' => array('salesperformance'=>'View Sales Performance Report' , 'exportsalesperformance'=>'Export Sales Proformance Report '),
							'Profitablity' => array('profitablity'=>'View Profitablity Report' , 'exportprofitablity'=>'Export Profitablity Report '),
							'Parts' => array('parts'=>'View Accessories Report' , 'exportparts'=>'Export Accessories Report '),
							'Model/Years' => array('modelyears'=>'View Model/Years Report' , 'exportmodelyears'=>'Export Model/Years Report '),
							'Deals' => array('deals'=>'View Deals Report' , 'exportdeals'=>'Export Deals Report '),
							'Vehicles' => array('vehicles'=>'Display Vehicle Statistices' , 'exportvehicles'=>'Export Vehicles Report '),
							'Users' => array('users'=>'Display Vehicle Statistices' , 'exportusers'=>'Export Users Report ')
						)
	);
					  
	private $roleId;
	private	$role;
	private $controllerPerms;
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
		$this->controllerPerms	= Zend_Json::decode($helperObj->loadControllerPermissions($this->roleId , 'reports')); 
    }
	
	
	
	
	// Vehicle Statistices
	public function liststatisticesAction(){
		
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Vehicle Statistices'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportstatistices' , $this->controllerPerms  , 'reports/exportstatistices' , 'Export Report' );				 
		
		/*
		$graph = new Graphs_PhpGraphLib_PhpGraphLib(500,350);
		$data = array(12124, 5535, 43373, 22223, 90432, 23332, 15544, 24523, 32778, 38878, 28787, 33243, 34832, 32302);
		$graph->addData($data);
		$graph->setTitle('Widgets Produced');
		$graph->setGradient('red', 'maroon');
		$graph->start();
		$graph->createGraph('c:\test.png');
		*/
		
		/*
		 $this->_helper->viewRenderer->setNoRender(true); 
        $this->_helper->layout->disableLayout(); 
		*/
		
		$this->view->statGrid = 'Data not calculated yet';	
	}
	
	public function exportstatisticesAction(){
		//
		
		// sample link http://www.ibm.com/developerworks/opensource/tutorials/os-php-zend5/section3.html
		
		/*    Adding Image on Page
		$pdf = new Zend_Pdf();
		$page = new Zend_Pdf_Page(Zend_Pdf_Page::SIZE_LETTER);
		$chompImage = new Zend_Pdf_Image_JPEG::imageWithPath(
							  dirname(__FILE__) . '/chomp.jpg');
		
		$pageHeight = $page->getHeight();
		$pageWidth = $page->getWidth();
		$imageHeight = 72;
		$imageWidth = 72;
		
		$topPos = $pageHeight - 36;
		$leftPos = 36;
		$bottomPos = $topPos - $imageHeight;
		$rightPos = $leftPos + $imageWidth;
		
		$page->drawImage($chompImage, $leftPos, $bottomPos, $rightPos, $topPos);
		$pdf->pages[0] = ($page);
		$pdf->save("chomp.pdf");
		*/
		
		
		/*  Adding Text on page
			$topPos = $pageHeight - 36;
			$leftPos = 36;
			$bottomPos = $topPos - $imageHeight;
			$rightPos = $leftPos + $imageWidth;
			
			$page->drawImage($chompImage, $leftPos, $bottomPos, $rightPos, $topPos);
			
			$style = new Zend_Pdf_Style();
			$style->setLineColor(new Zend_Pdf_Color_RGB(0.9, 0, 0));
			$style->setFillColor(new Zend_Pdf_Color_GrayScale(0.2));
			$style->setLineWidth(3);
			$style->setFont(
						new Zend_Pdf_Font::fontWithName(Zend_PDF_Font::FONT_HELVETICA_BOLD) ,32);
			
			$page->setStyle($style);
				 ->drawText('Chomp! To go', $rightPos + 32, $topPos - 48);
			
			$pdf->pages[0] = ($page);
			
			$pdf->save("chomp.pdf");
		*/
		
		
	}
	
	
	// Dealer performance
	public function dealerperformanceAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Dealer Performance'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportdealerperformance' , $this->controllerPerms  , 'reports/exportdealerperformance' , 'Export Report' );				 

		
		
		$this->view->statGrid = 'Data not calculated yet';	
	}
	
	public function exportdealerperformanceAction(){
	}
	
	
	// Sales Performance
	public function salesperformanceAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Sales Performance'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportsalesperformance' , $this->controllerPerms  , 'reports/exportsalesperformance' , 'Export Report' );				 

		
		
		$this->view->statGrid = 'Data not calculated yet';	
	}
	
	public function exportsalesperformanceAction(){
	}
	
	
	// Profitablity
	public function profitablityAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Profitablity'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportprofitablity' , $this->controllerPerms  , 'reports/exportprofitablity' , 'Export Report' );				 

		
		
		$this->view->statGrid = 'Data not calculated yet';	
	}
	
	public function exportprofitablityAction(){
	}
	
	
	// Parts
	public function partsAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Parts'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportparts' , $this->controllerPerms  , 'reports/exportparts' , 'Export Report' );				 

		
		
		$this->view->statGrid = 'Data not calculated yet';	
		
	}
	
	public function exportpartsAction(){
	}
	
	
	// Model Years
	public function modelyearsAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Model / Years'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportmodelyears' , $this->controllerPerms  , 'reports/exportmodelyears' , 'Export Report' );				 

		
		
		$this->view->statGrid = 'Data not calculated yet';	
	}
	
	public function exportmodelyearsAction(){
	}
	
	
	
	// deals
	public function dealsAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Deals'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportdeals' , $this->controllerPerms  , 'reports/exportdeals' , 'Export Report' );				 

		
		
		$this->view->statGrid = 'Data not calculated yet';	
	}
	
	public function exportdealsAction(){
	}
	
	
	// Vehicles
	public function vehiclesAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Vehicles'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportvehicles' , $this->controllerPerms  , 'reports/exportvehicles' , 'Export Report' );				 

		
		
		$this->view->statGrid = 'Data not calculated yet';	
	}
	
	public function exportvehiclesAction(){
	}
	
	
	// Dealer performance
	public function usersAction(){
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Users'));			 
		$this->view->addOption = $this->urls->singleLink( 'exportusers' , $this->controllerPerms  , 'reports/exportusers' , 'Export Report' );				 

		
		
		$this->view->statGrid = 'Data not calculated yet';	
	}
	
	public function exportusersAction(){
	}
	
	
	
   

}  // $class