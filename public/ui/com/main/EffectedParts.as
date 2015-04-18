package com.main{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.*;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.net.FileReference;
	import flash.net.FileFilter;
	import com.parts.*;


	public class EffectedParts extends MovieClip {
		
		public static var shopContainer:MovieClip;
		public static var toolContainer:MovieClip;
		
		public function EffectedParts() {
			shopContainer = new MovieClip();
			/*shopContainer.graphics.lineStyle(1, 0x0060ff);
			shopContainer.graphics.beginFill(0x20a107);
			shopContainer.graphics.drawRect(0,0,200,50);
			shopContainer.graphics.endFill();*/
			addChild(shopContainer);
			
			toolContainer = new MovieClip();
			addChild(toolContainer);
		}


	}//$class
}//$package