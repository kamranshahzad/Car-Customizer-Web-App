<?php


class Zend_Controller_Action_Helper_GrdUsers extends Zend_Controller_Action_Helper_Abstract{
	
	
	public function getStatusLink($status){
		if($status){
			return 'disbale';	
		}else{
			return 'enable';	
		}
	}
	
	
	public function displayUser( $roleId , $uid ){
		
		$mapUserObj = new Application_Model_Mapper_UserMapper();
		$mapRoleObj = new Application_Model_Mapper_RoleMapper();
		
		
		
		$out = '';
		if(count($mapUserObj->fetchUserByRef($roleId , $uid)) > 0 ){
			
			  $out .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
			  $out .= '<tr>
			  <td width="5%" class="contactDeptHeading">SER#</td>
			  <td width="10%" class="contactDeptHeading"><strong>USERNAME</strong></td>
			  <td width="10%" class="contactDeptHeading"><strong>PASSWORD</strong></td>
			  <td width="10%" class="contactDeptHeading"><strong>EMAIL</strong></td>
			  <td width="10%" class="contactDeptHeading"><strong>STATUS</strong></td>
			  <td width="10%" class="contactDeptHeading"><strong>ROLE</strong></td>
			  <td width="20%" class="contactDeptHeading">&nbsp;&nbsp;&nbsp;OPTIONS</td>
				</tr>';
			foreach ($mapUserObj->fetchUserByRef($roleId , $uid) as $parent){	
				
				if($mapUserObj->isChildUserExist($parent->getUserId()) > 0){
					$out .= '<tr>
					<td class="userTblTd">'.$parent->getUserId().'</td>
					<td class="userTblTd">'.$parent->getUserName().'</td>
					<td class="userTblTd">'.$parent->getPassword().'</td>
					<td class="userTblTd">'.$parent->getEmail().'</td>
					<td class="userTblTd">'.$this->getUserStatus($parent->getEnabled()).'</td>
					<td class="userTblTd">'.$mapRoleObj->fetchById($parent->getRoleId())->getRoleName().'</td>
					<td class="userTblTd">
						<a href="statususer/uid/'.$parent->getUserId().'" class="ask">'.$this->getStatusLink($parent->getEnabled()).'</a> | 
						<a href="modifyuser/uid/'.$parent->getUserId().'"> Modify</a> | 
						<a href="removeuser/uid/'.$parent->getUserId().'" class="ask"> Remove</a> 
					</td>
				   </tr>';
				}else{
				   	$out .= '<tr>';
					$out .= '<td colspan="7" style="padding:5px;">';
							
					$out .= '<table width="100%" border="0" class="childUserTbl">';
					$out .= '<tr>
						<td class="userTblTd">'.$parent->getUserId().'</td>
						<td class="userTblTd">'.$parent->getUserName().'</td>
						<td class="userTblTd">'.$parent->getPassword().'</td>
						<td class="userTblTd">'.$parent->getEmail().'</td>
						<td class="userTblTd">'.$this->getUserStatus($parent->getEnabled()).'</td>
						<td class="userTblTd">'.$mapRoleObj->fetchById($parent->getRoleId())->getRoleName().'</td>
						<td class="userTblTd">
							<a href="statususer/uid/'.$parent->getUserId().'" class="ask">'.$this->getStatusLink($parent->getEnabled()).'</a> | 
							<a href="modifyuser/uid/'.$parent->getUserId().'"> Modify</a> | 
							<a href="removeuser/uid/'.$parent->getUserId().'" class="ask"> Remove</a> 
						</td>
					   </tr>';		
					$out .= '</table>';
					$out .= '</td>';
					$out .= '<tr>';
				}
			}
		}else{
			$out .= 'No User Exists';	
		}
		$out .= '</table>';
		
		return $out;
	}
	
	
	public function showChildUsers(){
			
	}
	
	
	
	public function getUserStatus($status){
		if($status){
			return 'Enabled';	
		}else{
			return 'Disbaled';	
		}
	}
	
	
	
	
} // $

