package com.partslist{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import fl.transitions.*;
	import fl.transitions.easing.*;


	public class PartMC extends MovieClip {

		public var normalMc:MovieClip;
		public var selectMC:MovieClip;


		// data of the class
		public var CAT_ID:Number;
		public var PART_ID:Number;
		public var IS_SET:String;
		public var FROM:String='';

		public var imgSrc:String;
		public var partlbl:String;
		public var partPrice:Number;
		public var montlyPartPrice:Number;
		public var partDescription:String;
		public var partManufacture:String;
		public var partSKU:String;
		public var partStatus:Number;
		public var isEffected:Number;

		public var outline:MovieClip;


		public function PartMC() {// Constructor
		}

		public function DisplayOutline():void {
			if (! outline) {
				outline = new MovieClip();
				outline.graphics.lineStyle(2, 0xfd0000);
				outline.graphics.drawRoundRect(0, 0, 172 , 135 , 15, 15);
				addChild(outline);
			}
		}

		public function HideOutline():void {
			if (outline) {
				removeChild(outline);
			}
		}






	}//$class
}//$package