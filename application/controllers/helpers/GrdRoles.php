<?php

class Zend_Controller_Action_Helper_GrdRoles extends Zend_Controller_Action_Helper_Abstract{
	
	
	private $basePath ='';
	
	public function __construct(){
      $this->basePath = Zend_Registry::get('publicPath');
	  $this->dashArr = array(); 
	}

	public function showAllRoles($roleId , $accesPerm ){
		
		$mapObj = new Application_Model_Mapper_RoleMapper();
		$obj 	    = $mapObj->fetchAll($roleId);
		
		$output = '';
		$output .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" class="userTblCls">';
		$output .= '<tr>
                    <td width="15%" class="contactDeptHeading"><strong>Role</strong></td>
                    <td width="40%" class="contactDeptHeading"><strong>Description</strong></td>
                    <td width="20%" class="contactDeptHeading" colspan="3"><strong>Options</strong></td>
                  </tr>';
				  
		
		if(count($obj) > 0){
			foreach($obj as $p){
				$output .= '<tr>';
				$output .= '<td class="userTblTd">'.$p->getRoleName().'</td>';
				$output .= '<td class="userTblTd">'.$p->getDescription().'</td>';
				$output .= '<td class="userTblTd" align="center">';
				if($p->getRoleId() != 1 && $p->getRoleId() != 2 && $p->getRoleId() != 3 && $p->getRoleId() != 4){
					if(in_array( 'modifyrole' , $accesPerm )){
						$output .= '<a href="'.$this->basePath.'users/modifyrole/id/'.$p->getRoleId().'">modify</a> | ';	
					}
					if(in_array( 'removerole' , $accesPerm)){
						$output .= '<a href="'.$this->basePath.'users/removerole/id/'.$p->getRoleId().'">delete</a> | ';
					}
					if(in_array( 'listpermissions' , $accesPerm)){
						$output .= '<a href="'.$this->basePath.'users/listpermissions/id/'.$p->getRoleId().'">permssions</a>';
					}
				}else{
					if($p->getRoleId() != 1){
						if(in_array( 'listpermissions' , $accesPerm)){
							$output .= '<a href="'.$this->basePath.'users/listpermissions/id/'.$p->getRoleId().'">permssions</a>';
						}
					}
				}
				$output .= '</td>';
				$output .= '</tr>';
			}	
		}
		$output .= '</table>';
		return $output;
	}
	

	
	
} // $