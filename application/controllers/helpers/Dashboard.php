<?php


class Zend_Controller_Action_Helper_Dashboard extends Zend_Controller_Action_Helper_Abstract{
	
	private $db;
	private $path;
	private $icon;
	private $auth;	
	private $roleId;
	private $uid;
	private $uname;
	private $traCls;
	private $permCls;
	private $domain;
	
	
	public function __construct(){
      $this->db = Zend_Registry::get('database');
	  $this->auth = Zend_Auth::getInstance();
	  $identity = $this->auth->getIdentity();
      $this->roleId = strtolower($identity['roleId']);
	  $this->uid 	= strtolower($identity['uid']);
	  $this->uname 	= strtolower($identity['uname']);
	  $this->traCls	=  Zend_Controller_Action_HelperBroker::getStaticHelper('Traverser');
	  $this->permCls	=  Zend_Controller_Action_HelperBroker::getStaticHelper('Permissions');
	  $request = $this->getRequest();
	  
	}
	
	
	public function drawDashboard(){
		
		$flag = false;
		$output = '';
		
		
		$output .= $this->startDashBoard();
		$output .= $this->createAlertBox();
		$output .= '<br/>';
		$output .= $this->createStatistices();
		$output .= '<br/>';
		if($this->roleId == 1){
			$flag = true;
		}
		$output .= $this->groupsWrapper($this->buildDashboard($flag)); 
		return $output;
	}
	
	

	
	

	
	
	/* _Helper functions  */
	public function createAlertBox(){

		$output = '';
		$output .= '<div class="option-box-top">
        			<div class="heading">Alert & Updates</div>
       				</div>';
		$output .= '<div class="option-box-middle">
						<div class="alert-wrapper">
							<div class="alert-box-title">
								Instructions
							</div>
							<div class="message-txt">
								'.$this->permCls->getRoleDescription($this->roleId).'
							</div>
							<div class="alert-box-title">
								News Updates
							</div>
							 <div class="updates-container">
								'.$this->getNews().'
							</div>
						</div>
        			</div>';
        $output .= '<div class="option-box-bottom"></div>';
		
  		return $output;
	}
	
	public function getNews(){
		$output = '';
		$select = $this->db->select()->from("news")->where("status = ?", 1);
		$stmt 	= $select->query();
		$output .= '<ul>';
		while($row = $stmt->fetchObject()){
			$output .= '<li>';
			$output .= $row->title;
			$output .= '</li>';
		}
		$output .= '</ul>';
		return $output;
	}
	
	public function createStatistices(){
		
		$output = '';
		$output .= '<div class="option-box-top">';
    	$output .= '<div class="heading">Vehicle Statistices</div>';
  		$output .= '</div>';
  		$output .= '<div class="option-box-middle">';
    	$output .= '<div class="statis-wrapper"> ';
    	$output .= $this->getVehicleStatistices();
		$output .=  '</div>';
		$output .=  '</div>';
  	  	$output .= '<div class="option-box-bottom"></div>';
		  
		return $output;
	}
	
	
	public function getVehicleStatistices(){
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="statTbl">';
		$output .= '<tr><td width="30%"> &nbsp; </td><td class="head" width="30%"> ENABLED </td><td class="head" width="30%"> DISABLED </td><td class="head" width="30%"> TOTAL </td></tr>';
		$output .= '<tr>';
		$output .= '<td><b>Parts Manufacturers</b></td><td>&nbsp;&nbsp;&nbsp;10</td><td>10</td><td>10</td>';
		$output .= '</tr>';
		$output .= '<tr>';
		$output .= '<td><b>Vehicles</b></td><td>&nbsp;&nbsp;&nbsp;10</td><td>10</td><td>10</td>';
		$output .= '</tr>';
		$output .= '<tr>';
		$output .= '<td><b>Parts</b></td><td>&nbsp;&nbsp;&nbsp;10</td><td>10</td><td>10</td>';
		$output .= '</tr>';
		$output .= '<tr>';
		$output .= '<td><b>Wheels</b></td><td>&nbsp;&nbsp;&nbsp;10</td><td>10</td><td>10</td>';
		$output .= '</tr>';
		$output .= '</table>';
		return $output;	
	}
	
	public function groupsWrapper($groupOptionsView){
		$output = '';
		$output	.= '<div class="option-box-top2"></div>';
        $output	.= '<div class="option-box-middle">';
		$output .= $groupOptionsView;
		$output	.= '</div>';
        $output	.= '<div class="option-box-bottom"></div>';
       	$output	.= '<br />';
        return $output;	
	}
	
	public function createGroupHeading($headingTxt){
		return  '<div class="option-heading ">'.$headingTxt.'</div>';
	}
	
	
	
	public function createGroupOption($link , $lblTxt , $iconSrc = 'no-icon.png'){
		$output .= '<div class="icons-box"> <a href="'.Zend_Registry::get('publicPath').$link.'" class="icon-text"> <img src="'.Zend_Registry::get('publicPath').'/admin-images/'.$iconSrc.'" width="32" height="32" /></a>';
        $output .= '<div class="icon-text"> <a href="'.Zend_Registry::get('publicPath').$link.'" class="icon-text">'.$lblTxt.'</a></div>';
      	$output .= '</div>';
		return $output;
	}
	
	
	
	public function startDashBoard(){
		$output  = '';
		$output .= '<div class="adpage-title">
        			<div class="title" >DashBoard</div>
        			</div>';
       $output .= ' <div class="user-strip">
					<div class="user-name">
							Welcome '.$this->uname.'
						</div>
						<div class="logout"><a href="logout">Logout</a></div>
						<div class="clear"></div>
					</div>';
		return $output;
	}
	
	
	
	/*	_Dealer Steps   */
	public function dealerInstructionMessages(){
			
	}
	
	
	
	
	
	/*	_Helper functions  */
	private function getResourceId($resource){
		$select = $this->db->select()->from("acl_resources")->where('resource = ?', $resource );
		$stmt 	= $select->query();
		$row 	= $stmt->fetchObject();
		return $row->rid;
	}

	
	private function buildDashboard(){
		$output = '';
		$select = $this->db->select()->from("acl_dashboard");
		$stmt 	= $select->query();
		while($row = $stmt->fetchObject()){
			if($this->roleId == 1){    // just for admin
				$permStr    = $this->traCls->loadPermissions( $row->resource , $this->roleId );
				$optionsArr = $this->traCls->getOptions($row->details);
				if($this->traCls->isGroup( $permStr , $optionsArr)){
					$output .= $this->createGroupHeading($this->traCls->getInfo($row->details ,'title'));
					$output .= '<div class="icon-wrapper">';
					foreach($optionsArr as $key => $val){
						$output .= $this->createGroupOption( $this->traCls->getInfo($row->details).'/'.$key , $val['title'] , $val['icon'] );
					}
					if($this->roleId == 1 && $this->traCls->getInfo($row->details) == 'users'){  // insert prebuild option in users panel
						$output .= $this->createGroupOption( 'worker/prebuildpermissions' , 'Pre-Build Permissions' , 'permissions-icon.png' );
					}
					$output .= '<div class="clear"></div>';
					$output .= '</div>';
				}
			}else{
				$resourceId = $this->permCls->getResourceId($row->resource);
				if($this->permCls->isPermission($this->roleId , $resourceId)){          // if resource exists in permmisions table
					$permStr    = $this->traCls->loadPermissions( $row->resource , $this->roleId );
					$optionsArr = $this->traCls->getOptions($row->details);
					if($this->traCls->isGroup($permStr , $optionsArr)){
						
						$permArr  = Zend_Json::decode($permStr);
						$output .= $this->createGroupHeading($this->traCls->getInfo($row->details ,'title'));
						$output .= '<div class="icon-wrapper">';
						foreach($optionsArr as $key => $val){
							if(in_array($key , $permArr )){
								$output .= $this->createGroupOption( $this->traCls->getInfo($row->details).'/'.$key , $val['title'] , $val['icon'] );
							}
						}
						$output .= '<div class="clear"></div>';
						$output .= '</div>';
					}
				}
			}
		}
		return $output;
	}
	
	
	
	
	
	
}   // $ class





?>

