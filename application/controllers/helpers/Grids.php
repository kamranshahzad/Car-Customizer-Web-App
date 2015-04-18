<?php


class Zend_Controller_Action_Helper_Grids extends Zend_Controller_Action_Helper_Abstract{
	
	// all email templates will come here...
	
	private $basePath ='';
	
	public function __construct(){
      $this->basePath = Zend_Registry::get('publicPath');
	  $this->dashArr = array(); 
	}
	
	
	
	
	
	/*****************************************************************************************************
		_vehicle controller
	*/
	
	
	// #make
	public function makeGrid($data , $permArray ){
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="10%" class="contactDeptHeading"><strong>MAKE</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
                    <td width="10%" class="contactDeptHeading"><strong>ICON</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
				$output .= '<tr>
								<td class="userTblTd">'.$val->getMakeName().'</td>
								<td class="userTblTd">'.$val->getMakeDes().'</td>
								<td class="userTblTd"><img width="90" height="90" src="'.$this->basePath.'assets/makes/'.$val->getMakeIcon().'" /></td>
								<td class="userTblTd">';
			if(in_array( 'modifymakes' , $permArray)){					 
				$output .= '<a href="modifymakes/mid/'.$val->getMakeId().'"> Modify</a> |';
			}
			if(in_array( 'removemakes' , $permArray)){
				$output .= '<a href="removemakes/mid/'.$val->getMakeId().'"> Remove</a> ';
			}
			$output .= '</td></tr>';
		}
		$output .= '</table>';		  
		return $output;
	}
	
	
	//# Years
	public function yearsGrid($data , $permArray){
		$output = '';
		$output .= '<table width="600" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="10%" class="contactDeptHeading"><strong>YEAR</strong></td>
                    <td width="60%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getYear().'</td>
							<td class="userTblTd">'.$val->getDes().'</td>
							<td class="userTblTd">';
			if(in_array( 'modifymakes' , $permArray)){
				$output .= '<a href="modifymakeyears/yid/'.$val->getYearId().'"> Modify</a> | ';
			}
			if(in_array( 'modifymakes' , $permArray)){
				$output .= '<a href="removemakeyears/yid/'.$val->getYearId().'"> Remove</a> ';
			}
			$output .= '</td></tr>';
		}
		$output .= '</table>';
				  
		return $output;
	}
	
	//# Model
	public function modelGrid($data){
		
		$makeMap = new Application_Model_Mapper_MakeMapper();
		$yearMap = new Application_Model_Mapper_YearMapper();
		
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="25%" class="contactDeptHeading"><strong>MODEL NAME</strong></td>
                    <td width="20%" class="contactDeptHeading"><strong>MAKE NAME</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>YEAR</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>MODEL ICON</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getModelName().'</td>
							<td class="userTblTd">'.$makeMap->fetchById($val->getMakeId())->getMakeName().'</td>
							<td class="userTblTd">'.$yearMap->findById($val->getYearId())->getYear().'</td>
							<td class="userTblTd"><img width="70" height="70" src="'.$this->basePath.'assets/models/'.$val->getModelImage().'" /></td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getModelId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getModelId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';
		
		
		//$obj = new Application_Model_Mapper_ModelMapper();
		//print_r($obj->fetchAll());
		return $output;
	}
	
	//# Trims
	public function trimGrid($data){
		
		$modelMap = new Application_Model_Mapper_ModelMapper();
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="10%" class="contactDeptHeading"><strong>TRIM NAME</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>MODEL</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getTrimName().'</td>
							<td class="userTblTd">'.$modelMap->fetchById($val->getModelId())->getModelName().'</td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getTrimId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getTrimId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	
	//# Exterior Colors
	public function exteriorColorGrid($data){
		
		$trimMap = new Application_Model_Mapper_TrimsMapper();
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="30%" class="contactDeptHeading"><strong>EXTERIOR COLOR</strong></td>
                    <td width="20%" class="contactDeptHeading"><strong>TRIM</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>COLOR CODE</strong></td>
                    <td width="30%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getColorLabel().'</td>
							<td class="userTblTd">'.$val->getTrimId().'</td>
							<td class="userTblTd">'.$val->getColorCode().'</td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getExteriorColorId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getExteriorColorId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	
	//# Exterior Colors
	public function interiorColorGrid($data){
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="30%" class="contactDeptHeading"><strong>INTERIOR COLOR</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>TRIM</strong></td>
					<td width="30%" class="contactDeptHeading"><strong>COLOR ICON</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getColorLabel().'</td>
							<td class="userTblTd">'.$val->getTrimId().'</td>
							<td class="userTblTd"><img width="70" height="60" src="'.$this->basePath.'assets/interiors/'.$val->getColorImage().'" /></td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getInteriorColorId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getInteriorColorId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	//# Vehicles 
	public function vehicleGrid($data){
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="10%" class="contactDeptHeading"><strong>TITLE</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>FRONT-S</strong></td>
					<td width="30%" class="contactDeptHeading"><strong>REAR-S</strong></td>
					<td width="30%" class="contactDeptHeading"><strong>INTERIOR-S</strong></td>
					<td width="30%" class="contactDeptHeading"><strong>FRONT-B</strong></td>
					<td width="30%" class="contactDeptHeading"><strong>REAR-B</strong></td>
					<td width="30%" class="contactDeptHeading"><strong>INTERIOR-B</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getMakeName().'</td>
							<td class="userTblTd">'.$val->getMakeDes().'</td>
							<td class="userTblTd">'.$val->getMakeDes().'</td>
							<td class="userTblTd">'.$val->getMakeName().'</td>
							<td class="userTblTd">'.$val->getMakeDes().'</td>
							<td class="userTblTd">'.$val->getMakeDes().'</td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getMakeId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getMakeId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	//# Part Manufactueres
	public function manufacturesGrid($mapObj , $db , $roleId , $uid , $permArray ){
		$output = '';
		
		if($roleId == 4)
		return '';
		
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
					<td width="10%" class="contactDeptHeading"><strong>TITLE</strong></td>
					<td width="50%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
					<td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
				  </tr>';
		
		if($roleId == 3){	// just for dealer 
			$select = $db->select()->from(array('m' => 'part_manufacturer'),array('manufacturer_name'))->join(array('um' => 'user_part_manufactures'),'m.manufacturer_id = um.manufacturer_id',array('notes','manufacturer_id','status'))->where('um.uid = ? ', $uid ); //->where('p.role_id = ? ', $roleId );
			$stmt = $select->query(); 
			while($row = $stmt->fetchObject()){
				$output .= '<tr>
								<td class="userTblTd">'.$row->manufacturer_name.'</td>
								<td class="userTblTd">'.$row->notes.'</td>
								<td class="userTblTd"> ';
				if(in_array( 'statuspartmanufacturer' , $permArray)){		
					$output	.= '<a href="statuspartmanufacturer/mid/'.$row->manufacturer_id.'">'.$this->getStatusLink($row->status).'</a>  | ';
				}
				if(in_array( 'modifypartmanufacturer' , $permArray)){		
					$output .= '<a href="modifypartmanufacturer/mid/'.$row->manufacturer_id.'"> modify note </a>';
				}
				$output .= '</td></tr>';	
			}
		}else{
			
			$data = $mapObj->fetchAll();
			foreach($data as $val){			  
				$output .= '<tr>
								<td class="userTblTd">'.$val->getManName().'</td>
								<td class="userTblTd">'.$val->getNote().'</td>
								<td class="userTblTd"> 
									<a href="modifymakes/mid/'.$val->getManId().'"> enable</a> | 
									<a href="modifymakes/mid/'.$val->getManId().'"> Modify</a> | 
									<a href="removemakes/mid/'.$val->getManId().'"> Remove</a> 
								</td>
							</tr>';
			}
		}
		
		
		$output .= '</table>';
		
		
		return $output;
	}
	
	
	//# Part Types
	public function partTypesGrid( $db , $roleId , $uid , $peram ){
		$output = '';
		
		if($roleId == 4)
		return '';
		
		
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="10%" class="contactDeptHeading"><strong>TITLE</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		
		if($roleId == 3){	// just for dealer 	
			$select = $db->select()->from(array('pt' => 'part_types'),array('part_type_name'))->join(array('upt' => 'user_part_types'),'pt.part_type_id = upt.part_type_id',array('id','part_type_id','status'))->where('upt.uid = ? ', $uid );
			$stmt = $select->query();
			while($row = $stmt->fetchObject()){
				$output .= '<tr>
								<td class="userTblTd">'.$row->part_type_name.'</td>
								<td class="userTblTd">'.$row->status.'</td>
								<td class="userTblTd"> 
									<a href="#"> '.$this->getStatusLink($row->status).'</a> 
								</td>
							</tr>';
			}
		}else{
				
		}
		$output .= '</table>';	  
		return $output;
	}
	
	//# Part Categories
	public function partCategoriesGrid(){
		$output = '';
		
		$catMap = new Application_Model_Mapper_PartCategoryMapper();
		$data   = $catMap->fetchAll();
		$typeMap = new Application_Model_Mapper_PartTypeMapper();
		
		
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="20%" class="contactDeptHeading"><strong>TITLE</strong></td>
					<td width="10%" class="contactDeptHeading"><strong>PART TYPE</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getCatName().'</td>
							<td class="userTblTd">'.$typeMap->fetchById($val->getTypeId())->getTypeName().'</td>
							<td class="userTblTd">'.$val->getDes().'</td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getCatId().'"> enable</a> | 
								<a href="modifymakes/mid/'.$val->getCatId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getCatId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	//# Part Categories
	public function wheelSizesGrid(){
		$output = '';
		
		$catMap = new Application_Model_Mapper_PartCategoryMapper();
		$data   = $catMap->fetchAll('w');
		$typeMap = new Application_Model_Mapper_PartTypeMapper();
		
		
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="20%" class="contactDeptHeading"><strong>TITLE</strong></td>
					<td width="10%" class="contactDeptHeading"><strong>PART TYPE</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getCatName().'</td>
							<td class="userTblTd">'.$typeMap->fetchById($val->getTypeId())->getTypeName().'</td>
							<td class="userTblTd">'.$val->getDes().'</td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getCatId().'"> enable</a> | 
								<a href="modifymakes/mid/'.$val->getCatId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getCatId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	
	//# Wheel Types / Wheel Categories
	public function wheelTypesGrid(){
		$output = '';
		
		$catMap = new Application_Model_Mapper_WheelCategoryMapper();
		$data   = $catMap->fetchAll('w');
		$typeMap = new Application_Model_Mapper_PartTypeMapper();
		
		
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="20%" class="contactDeptHeading"><strong>TITLE</strong></td>
					<td width="10%" class="contactDeptHeading"><strong>WHEEL SIZE</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getWheelTypeName().'</td>
							<td class="userTblTd"></td>
							<td class="userTblTd">'.$val->getDes().'</td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getWheelTypeId().'"> enable</a> | 
								<a href="modifymakes/mid/'.$val->getWheelTypeId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getWheelTypeId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	//# Parts
	public function partsGrid($data){
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="10%" class="contactDeptHeading"><strong>TITLE</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getMakeName().'</td>
							<td class="userTblTd">'.$val->getMakeDes().'</td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getMakeId().'"> enable</a> | 
								<a href="modifymakes/mid/'.$val->getMakeId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getMakeId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	//# Wheels
	public function wheelGrid($data){
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="10%" class="contactDeptHeading"><strong>TITLE</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getMakeName().'</td>
							<td class="userTblTd">'.$val->getMakeDes().'</td>
							<td class="userTblTd"> 
								<a href="modifymakes/mid/'.$val->getMakeId().'"> enable</a> | 
								<a href="modifymakes/mid/'.$val->getMakeId().'"> Modify</a> | 
								<a href="removemakes/mid/'.$val->getMakeId().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	/*****************************************************************************************************
		_user controller
	*/
	
	/*****************************************************************************************************
		_cms controller
	*/
	
	// # News
	public function newsGrid($data){
		
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="30%" class="contactDeptHeading"><strong>TITLE</strong></td>
                    <td width="20%" class="contactDeptHeading"><strong>DESCRIPTION</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>DATE</strong></td>
                    <td width="30%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getTitle().'</td>
							<td class="userTblTd">'.$val->getDes().'</td>
							<td class="userTblTd">'.$val->getDate().'</td>
							<td class="userTblTd"> 
								<a href="statusnews/nid/'.$val->getNid().'"> enable</a> | 
								<a href="modifynews/nid/'.$val->getNid().'"> Modify</a> | 
								<a href="removenews/nid/'.$val->getNid().'"> Remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	/*****************************************************************************************************
		_parts controller
	*/
	
	
	
	/*****************************************************************************************************
		_settings controller
	*/
	public function listEmailTemplatesGrid($data){
		
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="30%" class="contactDeptHeading"><strong>TITLE</strong></td>
                    <td width="20%" class="contactDeptHeading"><strong>BODY TEXT</strong></td>
                    <td width="30%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getVarName().'</td>
							<td class="userTblTd">'.$val->getVarValue().'</td>
							<td class="userTblTd"> 
								<a href="modifyemailtemplate/vid/'.$val->getVarName().'"> Modify</a>
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	/*****************************************************************************************************
		_deals controller
	*/
	
	public function showDeals($data , $type = 0){
		
		$dealMap    = new Application_Model_Mapper_DealMapper();
		$vehicleMap = new Application_Model_Mapper_VehicleMapper();
		//$vehicleMap->findByVehicleId($val->getVehicleId())->getTitle()
		
		$output = '';
		$output .= $this->topWrapperBox($this->getDealType($type));
		if(count($data) > 0){
			$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
			$output .= '<tr>
						<td width="15%" class="contactDeptHeading"><strong>REF#</strong></td>
						<td width="20%" class="contactDeptHeading"><strong>VEHICLE</strong></td>
						<td width="15%" class="contactDeptHeading" align="center"><strong>DATE</strong></td>
						<td width="15%" class="contactDeptHeading"><strong>PAYMENT TYPE</strong></td>
						<td width="30%" class="contactDeptHeading" align="center">OPTIONS</td>
					  </tr>';
			foreach($data as $val){			  
				$output .= '<tr>
								<td class="userTblTd">'.$dealMap->fetchById($val->getDealId())->getRefNo().'</td>
								<td class="userTblTd">'.$vehicleMap->findByVehicleId($dealMap->fetchById($val->getDealId())->getVehicleId())->getTitle().'</td>
								<td class="userTblTd">'.$this->getDealStatusDate( $val , $type ).'</td>
								<td class="userTblTd">'.$dealMap->fetchById($val->getDealId())->getPaymentType().'</td>
								<td class="userTblTd" align="center">
									'.$this->getDealTypeLink($type , $val->getId() , $val->getDealId() ).' |  
									<a href="'.$this->basePath.'deal/viewdealaccessories/did/'.$val->getId().'">accessories</a>  |  
									<a href="'.$this->basePath.'deal/viewdealaccessories/did/'.$val->getId().'" class="ask">remove</a> 
								</td>
							</tr>';
			}
			$output .= '</table>';
		}else{
			$output .= 'No '.$this->getDealType($type).' Exists';
		}
		$output .= $this->bottomWrapperBox();
		
		return $output;	
	}
	function getDealType($type){
		$out = '';
		switch($type){
			case 0:
				$out = 'Pending Deal';
				break;
			case 1:
				$out = 'Open Deal';
				break;
			case 2:
				$out = 'Completed Deal';
				break;
			case 3:
				$out = 'Finalized Deal';
				break;
		}
		return $out;
	}
	function getDealTypeLink($type , $id , $dealId ){
		$out = '';
		switch($type){
			case 0:
				$out = '<a href="'.$this->basePath.'deal/statusdeal/id/'.base64_encode(Zend_Json::encode(array('id'=>$id , 'type'=>'1' , 'dealId'=> $dealId ))).'">open deal</a>';
				break;
			case 1:
				$out = '<a href="'.$this->basePath.'deal/statusdeal/id/'.base64_encode(Zend_Json::encode(array('id'=>$id , 'type'=>'2' , 'dealId'=> $dealId))).'">complete deal</a>';
				break;
			case 2:
				$out = '<a href="'.$this->basePath.'deal/statusdeal/id/'.base64_encode(Zend_Json::encode(array('id'=>$id , 'type'=>'3' , 'dealId'=> $dealId))).'">finalized deal</a>';
				break;
			case 3:
				$out = '<a href="'.$this->basePath.'deal/statusdeal/id/'.base64_encode(Zend_Json::encode(array('id'=>$id , 'type'=>'4' , 'dealId'=> $dealId))).'">order deal</a>';
				break;
		}
		return $out;
	}
	function getDealStatusDate($obj , $type){
		$out = '';
		switch($type){
			case 0:
				$out = $obj->getPendingDateTime();
				break;
			case 1:
				$out = $obj->getOpenDateTime();
				break;
			case 2:
				$out = $obj->getCompleteDateTime();
				break;
			case 3:
				$out = $obj->getFinalizedDateTime();
				break;
		}
		return $out;
	}
	
	
	
	
	public function showDealsByUsers($data){
		$output = '';
		
		$output .= '<div class="dealsUsers"><b>Test name: Sales Person</b></div>';
		$output .= '<div class="dealsBlock"><div class="dealStatus"><b>Pending Deal</b></div><div class="dealCount"><b>7 - Deals</b></div><div class="clear"></div></div>';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="30%" class="contactDeptHeading"><strong>REF#</strong></td>
                    <td width="20%" class="contactDeptHeading"><strong>VEHICLE</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>PAYMENT TYPE</strong></td>
                    <td width="30%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getRefNo().'</td>
							<td class="userTblTd">'.$val->getVehicleId().'</td>
							<td class="userTblTd">'.$val->getPaymentType().'</td>
							<td class="userTblTd"> 
								<a href="'.$this->basePath.'deal/viewdealaccessories/did/'.$val->getDealId().'">deal accessories</a>  |  
								<a href="'.$this->basePath.'deal/viewdealaccessories/did/'.$val->getDealId().'">remove deal</a> 
							</td>
						</tr>';
		}
		$output .= '</table><br/>';	  
		return $output;	
	}
	
	
	public function showDealsAccessories($data){
		
		$partMap = new Application_Model_Mapper_PartsMapper();
		$dealMap = new Application_Model_Mapper_DealMapper();
		
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="10%" class="contactDeptHeading"><strong>REF#</strong></td>
                    <td width="20%" class="contactDeptHeading"><strong>PART TYPE</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>PART NAME</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>IS SET?</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>IS PURCHANSE?</strong></td>
                    <td width="30%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$dealMap->fetchById($val->getDealId())->getRefNo().'</td>
							<td class="userTblTd">'.$this->getPartType($val->getPartType()).'</td>
							<td class="userTblTd">'.$partMap->findById($val->getPartId())->getPartName().'</td>
							<td class="userTblTd">'.$this->getIsset($val->getIsset()).'</td>
							<td class="userTblTd">'.$this->getPurchansed($val->getPurchase()). '</td>
							<td class="userTblTd"> 
								<a href="'.$this->basePath.'deal/removedealaccessories/aid/'.$val->getAccessoryId().'">remove</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		
		
		return $output;	
	}
	function getPartType($val){
			return 	($val == "p") ? "Part": "Wheel";
	}
	function getPurchansed($val){
			return 	($val == 1) ? "Yes": "No";
	}
	function getIsset($val){
			return 	($val == "N") ? "Not Set": "Set";
	}
	
	public function showCommisionsGrid($data){
		
		$dealMap = new Application_Model_Mapper_DealMapper();
		
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="20%" class="contactDeptHeading"><strong>DEAL REF#</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>COMMISION QUANTITY</strong></td>
					<td width="30%" class="contactDeptHeading"><strong>COMMISION TYPE</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$dealMap->fetchById($val->getDealId())->getRefNo().'</td>
							<td class="userTblTd">'.$val->getQuntity().'</td>
							<td class="userTblTd">'.$this->getCommisionType($val->getType()).'</td>
							<td class="userTblTd"> 
								<a href="'.$this->basePath.'deal/modifycommisions/id/'.$val->getId().'">set commision</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;	
	}
	function getCommisionType($type){
		return 	($type == "p") ? "% - Persentage": "$ - Amount";
	}
	
	public function showInvoiceGrid($data){
		
		$dealMap = new Application_Model_Mapper_DealMapper();
		
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="20%" class="contactDeptHeading"><strong>DEAL REF#</strong></td>
                    <td width="30%" class="contactDeptHeading"><strong>COMMISION QUANTITY</strong></td>
					<td width="30%" class="contactDeptHeading"><strong>DATE</strong></td>
                    <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$dealMap->fetchById($val->getDealId())->getRefNo().'</td>
							<td class="userTblTd">'.$val->getInvoiceId().'</td>
							<td class="userTblTd">10/12/2001</td>
							<td class="userTblTd"> 
								<a href="'.$this->basePath.'deal/viewinvoice/id/'.$val->getId().'">view invoice</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;	
		
	}
	
	
	
	
	// # orders
	public function showFullPendingOrdersGrd(){}
	public function showFullComplteOrdersGrd(){}
	
	public function showPednigOrdersGrd($data){
		$dealMap = new Application_Model_Mapper_DealMapper();
		$output = '';
		$output .= $this->topWrapperBox("PENDING ORDERS");
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
					<td width="15%" class="contactDeptHeading"><strong>DEAL REF#</strong></td>
                    <td width="15%" class="contactDeptHeading"><strong>ORDER ID</strong></td>
                    <td width="15%" class="contactDeptHeading"><strong>TOTAL AMOUNT</strong></td>
					<td width="15%" class="contactDeptHeading"><strong>DISCOUNT</strong></td>
					<td width="15%" class="contactDeptHeading"><strong>TAX</strong></td>
					<td width="15%" class="contactDeptHeading"><strong>DATE</strong></td>
                    <td width="30%" class="contactDeptHeading">OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$dealMap->fetchById($val->getDealId())->getRefNo().'</td>
							<td class="userTblTd">'.$val->getOrderId().'</td>
							<td class="userTblTd">'.$val->getTotalAmount().'</td>
							<td class="userTblTd">'.$val->getTax().'</td>
							<td class="userTblTd">'.$val->getDiscount().'</td>
							<td class="userTblTd">'.$val->getCdate().'</td>
							<td class="userTblTd"> 
								<a href="'.$this->basePath.'deal/modifyorder/orderid/'.$val->getOrderId().'">modify</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';
		$output .= $this->bottomWrapperBox();
		return $output;	
	}
	
	public function showCompleteOrderGrd(){	
		$output = '';
		$output .= $this->topWrapperBox("COMPLETED ORDERS");
		$output .= 'show completed orders grid';
		$output .= $this->bottomWrapperBox();
		return $output; 
	}
	
	public function searchOrdersGrd(){
		$output = '';
		$output .= $this->topWrapperBox("SEARCHED ORDERS");
		$output .= 'seach orders result will display here';
		$output .= $this->bottomWrapperBox();
		return $output; 
	}
	
	
	
	//# Backgrounds
	public function backgroundsGrid(){
		
		$bgMap = new Application_Model_Mapper_BackgroundsMapper();
		$bgData  = $bgMap->fetchAll();
		
		$varMap  = new Application_Model_Mapper_VariableMapper();
		$varData = $varMap->findByKey('default_background'); 
		
		$defaultBg = $bgMap->findById($varData->getVarValue());
		
		$output = '';
		$output .= '<table>';
		$output .= '<tr><td><b>Default Background</b></td><tr>';
		$output .= '<tr>';
		$output .= '<td><img src="'.$this->basePath.'assets/backgrounds/'.$defaultBg->getBgImage().'" width="150" height="110" /><td>';
		$output .= '<td>'.$defaultBg->getBgName().'<td>';
		$output .= '</tr>';
		$output .= '</table>';
		
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="30%" class="contactDeptHeading"><strong>TITLE</strong></td>
                    <td width="20%" class="contactDeptHeading"><strong>IMAGE</strong></td>
					<td width="20%" class="contactDeptHeading"><strong>STATUS</strong></td>
                    <td width="30%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
                  </tr>';
		foreach($bgData as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$val->getBgName().'</td>
							<td class="userTblTd"><img src="'.$this->basePath.'assets/backgrounds/'.$val->getBgImage().'" width="150" height="110" /></td>
							<td class="userTblTd">'.$val->getStatus().'</td>
							<td class="userTblTd"> 
								<a href="statusnews/nid/'.$val->getBgId().'"> enable</a> | 
								<a href="modifynews/nid/'.$val->getBgId().'"> Modify</a> | 
								<a href="removenews/nid/'.$val->getBgId().'"> Remove</a> |
								<a href="removenews/nid/'.$val->getBgId().'"> Default</a>
							</td>
						</tr>';
		}
		$output .= '</table>';	  
		return $output;
	}
	
	
	
	/*****************************************************************************************************
		_technical controller
	*/
	
	public function showPednigInstallGrd($data , $groupName ){
		
		$dealMap = new Application_Model_Mapper_DealMapper();
		$output = '';
		$output .= $this->topWrapperBox($groupName);
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
					<td width="15%" class="contactDeptHeading"><strong>DEAL REF#</strong></td>
                    <td width="15%" class="contactDeptHeading"><strong>STATUS</strong></td>
                    <td width="15%" class="contactDeptHeading"><strong>DATE</strong></td>
                    <td width="30%" class="contactDeptHeading">OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$dealMap->fetchById($val->getDealId())->getRefNo().'</td>
							<td class="userTblTd">'.$val->getComplete().'</td>
							<td class="userTblTd">'.$val->getIDate().'</td>
							<td class="userTblTd"> 
								<a href="'.$this->basePath.'technicals/listparts/id/'.$val->getInstallId().'">Installation...</a> 
							</td>
						</tr>';
		}
		$output .= '</table>';
		$output .= $this->bottomWrapperBox();
		return $output;	
	}
	public function showInstallPartsGrd( $data ){
		
		$dealMap = new Application_Model_Mapper_PartsMapper();
		
		$output = '';
		$output .= '<div>Deal Ref# <b>02254</b></div>';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
					<td width="15%" class="contactDeptHeading"><strong>PART NAME</strong></td>
                    <td width="15%" class="contactDeptHeading"><strong>STATUS</strong></td>
                    <td width="15%" class="contactDeptHeading"><strong>DATE</strong></td>
					<td width="15%" class="contactDeptHeading"><strong>INSTALL TIME</strong></td>
                    <td width="30%" class="contactDeptHeading">OPTIONS</td>
                  </tr>';
		foreach($data as $val){			  
			$output .= '<tr>
							<td class="userTblTd">'.$dealMap->findById($val->getPartId())->getPartName().'</td>
							<td class="userTblTd">'.$this->getInstallStatus($val->getIsDone(),$val->getPid()).'</td>
							<td class="userTblTd">'.$val->getPTime().'</td>
							<td class="userTblTd">'.$val->getPTime().'</td>
							<td class="userTblTd"> 
								'.$this->getInstallLink($val->getIsDone(), $val->getPid() ).'
							</td>
						</tr>';
		}
		$output .= '</table>';
		$output .= '<a href="#">Complete Deal Installation</a>';
		return $output;	
	}
	function getInstallStatus($Is , $pid){
		$output = '';
		if($Is){
			$output = '<a href="'.$this->basePath.'technicals/viewpartsdetail/pid/'.$pid.'">View Details</a>';
		}else{
			$output = 'No Installed';
		}
		return $output;
	}
	function getInstallLink( $Is , $pid ){
		$output = '';
		if($Is){
			$output = '<a href="'.$this->basePath.'technicals/uninstallparts/pid/'.$pid.'">un-install</a>';
		}else{
			$output = '<a href="'.$this->basePath.'technicals/installparts/pid/'.$pid.'">install</a>';
		}
		return $output;
	}
	
	
	
	
	
	/*****************************************************************************************************
		_helper functions
	*/
	public function getStatusLink($status){
		if($status){
			return 'disbale';	
		}else{
			return 'enable';	
		}
	}
	
	
	public function topWrapperBox($groupName , $link=''){
		$output = '<div class="option-box-top">
        			<div class="heading"><div style="float:left;width:60%;">&nbsp;&nbsp;&nbsp;<b>'.$groupName.'</b></div><div style="float:right;width:40%;text-align:right;">'.$link.' &nbsp;&nbsp;&nbsp;</div> </div>
			  	  </div>
			  <div class="option-box-middle">
				<div class="quick-links-wrapper">
				  <div id="navcontainer">  		
					<br/>
					<div class="modelListContainer">';
		return $output;
	}
	public function bottomWrapperBox(){
		$output = ' </div>
            <div class="clear"></div>
				  </div>
				</div>
			  </div>
			  <div class="option-box-bottom"></div>';
		return $output;
	}
	
	
	
	
} // $



?>