<?php
class maxChart {
   var $data;         // The data array to display
   var $type = 1;     // Vertical:1 or Horizontal:0 chart
   var $title;        // The title of the chart
   var $width = 300;  // The chart box width 
   var $height = 200; // The chart box height
   var $metaSpaceHorizontal = 60; // Total space needed for chart title + bar title + bar value
   var $metaSpaceVertical = 60; // Total space needed for chart title + bar title + bar value
   var $variousColors = false;
   
   var $imgPaths = '';
   
   function maxChart($data , $imgPath){
      $this->data = $data;
	  $this->imgPaths = $imgPath;
   }
   
   function displayChart($title='', $type, $width=300, $height=200, $variousColor=false){
      $this->type          = $type;
      $this->title         = $title;
      $this->width         = $width;
      $this->height 	   = $height;
      $this->variousColors = $variousColor;
	  
	  
	  $output = '';
      $output .= '<br/><div class="chartbox" style="width:'.$this->width.'px; height:'.$this->height.'px;"><b>'.$this->title.'</b><br/>'."\r\n";
  
      if($this->type == 1){  
	  	$output .= $this->drawVertical();
	  }else{
      	$output .= $this->drawHorizontal(); 
	  }
      $output .= '</div>';
	  
	  
	  return $output;
   }
   
   function getMaxDataValue(){
      $max = 0;
 
      foreach ($this->data as $key=>$value) {
         if ($value > $max) $max = $value;	
      }
      
      return $max;
   }
   
   function getElementNumber(){
      return sizeof($this->data);
   }
   
   function drawVertical(){
      $multi = ($this->height -$this->metaSpaceHorizontal) / $this->getMaxDataValue();
      $max   = $multi * $this->getMaxDataValue();
      $barw  = floor($this->width / $this->getElementNumber()) - 5;
      
      $i = 1;
      
      foreach ($this->data as $key=>$value) {
         $b = floor($max - ($value*$multi));
         $a = $max - $b;
         
         if ($this->variousColors) $color = ($i % 5) + 1;
         else $color = 1;
         $i++;
         
		 $out  = '';
         $out .= '  <div class="barv">'."\r\n";
         $out .= '    <div class="barvvalue" style="margin-top:'.$b.'px; width:'.$barw.'px;">'.$value.'</div>'."\r\n";
	     $out .= '    <div><img src="'.$this->imgPaths.'/bar'.$color.'.png" style="width:'.$barw.'px; height:'.$a.'px;" /></div>'."\r\n";
         $out .= '    <div class="barvvalue" style="width:'.$barw.'px;">'.$key.'</div>'."\r\n";
         $out .= '  </div>'."\r\n";
      }
	   return $out;
   }
   
   function drawHorizontal(){
      $multi = ($this->width-170) / $this->getMaxDataValue();
      $max   = $multi * $this->getMaxDataValue();
      $barh  = floor(($this->height - 35) / $this->getElementNumber());
      
      $i = 1;
	  $output  = '';
      foreach ($this->data as $key=>$value) 
	  {
         $b = floor($value*$multi);
         if ($this->variousColors) $color = ($i % 5) + 1;
         else $color = 1;
         $i++;
         $output .= '  <div class="barh" style="height:'.$barh.'px;">'."\r\n";
         $output .= '    <div class="barhcaption" style="line-height:'.$barh.'px; width:90px;">'.$key.'</div>'."\r\n";
         $output .= '    <div class="barhimage"><img src="'.$this->imgPaths.'/barh'.$color.'.png" style="width:'.$b.'px; height:'.$barh.'px;" /></div>'."\r\n";
         $output .= '    <div class="barhvalue" style="line-height:'.$barh.'px; width:30px;">'.$value.'</div>'."\r\n";
         $output .= '  </div>';
      }
	  return $output;
   }
   
   
}


?>