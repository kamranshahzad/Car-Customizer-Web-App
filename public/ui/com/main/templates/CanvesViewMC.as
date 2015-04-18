package com.main.templates{
	
	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	
	
	public class CanvesViewMC extends MovieClip{
		public var pictureValue:Number;
		public function CanvesViewMC( )
		{
			var newBox:MovieClip = new MovieClip();
			//newBox.graphics.lineStyle(1, 0x0060ff);
			//newBox.graphics.beginFill(0x20a107);
			//newBox.graphics.drawRect(0,0,50,50);
			//newBox.graphics.endFill();
			addChild(newBox);
		}
		
	} //$class
} //$package