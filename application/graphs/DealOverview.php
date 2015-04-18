<?php

	require_once ('jpgraph_lib/jpgraph.php');
	require_once ('jpgraph_lib/jpgraph_bar.php');
	
	// We need some data
	
	//$datay=array(0.13,0.25,0.21,0.35);
	//$datax=array("January","February","March","April");
	
	$monthArr = array ("" , "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
	
	$datax = array();
	$datay = explode(',',$_REQUEST['d']);
	array_pop($datay); 
	
	$monthIdArr = explode(',',$_REQUEST['m']);
	
	foreach($monthIdArr as $val){
		if($val != ''){
			array_push( $datax , $monthArr[$val]);
		}
	}
	
	
	// Setup the graph.
	$graph = new Graph(370,240);
	$graph->img->SetMargin(60,20,35,75);
	$graph->SetScale("textlin");
	$graph->SetMarginColor("white:1.0");
	$graph->SetShadow();
	
	// Set up the title for the graph
	$graph->title->Set("Deals w.r.t Months");
	$graph->title->SetMargin(8);
	$graph->title->SetFont(FF_VERDANA,FS_BOLD,12);
	$graph->title->SetColor("darkred");
	
	// Setup font for axis
	$graph->xaxis->SetFont(FF_VERDANA,FS_NORMAL,10);
	$graph->yaxis->SetFont(FF_VERDANA,FS_NORMAL,10);
	
	// Show 0 label on Y-axis (default is not to show)
	$graph->yscale->ticks->SupressZeroLabel(false);
	
	// Setup X-axis labels
	$graph->xaxis->SetTickLabels($datax);
	$graph->xaxis->SetLabelAngle(50);
	
	// Create the bar pot
	$bplot = new BarPlot($datay);
	$bplot->SetWidth(0.6);
	
	// Setup color for gradient fill style
	$bplot->SetFillGradient("navy:0.9","navy:1.85",GRAD_LEFT_REFLECTION);
	
	// Set color for the frame of each bar
	$bplot->SetColor("white");
	$graph->Add($bplot);
	
	// Finally send the graph to the browser
	$graph->Stroke();

?>