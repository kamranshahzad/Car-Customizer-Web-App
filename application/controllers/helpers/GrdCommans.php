<?php


class Zend_Controller_Action_Helper_GrdCommans extends Zend_Controller_Action_Helper_Abstract{
	
	
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

