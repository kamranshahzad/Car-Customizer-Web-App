package com.preloader{

	import flash.display.Sprite;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	import flash.display.SimpleButton;
	import flash.text.*;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;


	public class Preloader extends MovieClip {
		
		public var preloaderMC:MovieClip;
		public var apple:Apple;
		
		public function Preloader( $txt:String ) {
			preloaderMC = new MovieClip();
			addChild(preloaderMC);
			
			setPreloaderTxt($txt);
			
			apple = new Apple();
			preloaderMC.addChild(apple);
			apple.width = 60;
			apple.height = 60;
		}
		
		public function setPreloaderTxt($txt:String):void{
			var txtField:TextField = new TextField();
			txtField.htmlText=$txt;
			txtField.width = 400;
			txtField.height = 20;
			txtField.x=-170;
			txtField.y=60;
			txtField.selectable=false;
			txtField.setTextFormat( setTxtFormat());
			
			preloaderMC.addChild(txtField);
		}
		
		public function setTxtFormat():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0xc41312;
			txtFormat.font="Verdana";
			txtFormat.size=11;
			//txtFormat.bold=true;
			txtFormat.align="center";
			return txtFormat;
		}
		
		

		
	}// $class
}
