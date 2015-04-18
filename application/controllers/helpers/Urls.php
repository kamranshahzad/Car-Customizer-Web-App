<?php


class Zend_Controller_Action_Helper_Urls extends Zend_Controller_Action_Helper_Abstract{
	
	
	private $basePath;
	
	public function __construct(){
      $this->basePath =  Zend_Registry::get('publicPath');
	}
	
	public function getBaseUrl(){
		return $this->basePath;	
	}
	
	// # breadcrumb
	private function urlFormats($urlArr){
		$numItems = count($urlArr);
		$i = 0;
		$output = '';
		$output .= '<div class="user-name">';
		foreach($urlArr as $path => $label){
			if($label == end($urlArr)) {
				$output .= $label;
				$output .= ' ';
			}else{
				$output .= '<a href="'.$this->basePath.$path.'">'.$label.'</a>';
				$output .= ' >> ';
			}
		}
		$output .= '</div>';
		return $output;
	}
	
	public function drawUrls($urlArr){
		$output = '';
		$output .= $this->urlFormats($urlArr); 
		$output .= '<div class="logout"><a href="'.$this->basePath.'/admin/logout">Logout</a></div>';
		return $output;
	}
	
	
	// # add button
	public function singleLink( $key , $parmArr  , $path , $label = ''){
		$output = '';
		if(in_array( $key , $parmArr )){
			$output = '<a href="'.$this->basePath.$path.'" class="hyperlinkBtn Fr">'.$label.'</a>';	
		}
		return $output;
	}
	
} //$