<?php


class Zend_Controllers_Action_Helper_Grd_OrderGrd extends Zend_Controller_Action_Helper_Abstract{
	
	// all email templates will come here...
	
	private $basePath ='';
	
	public function __construct(){
      $this->basePath = Zend_Registry::get('publicPath');
	  $this->dashArr = array(); 
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