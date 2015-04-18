package com.main{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import gs.TweenLite;
	import gs.OverwriteManager;


	public class HighLight extends MovieClip {

		public var bigBox:Sprite;
		public var smallBox:Sprite;
		public var canvesBoxDimentionsArr:Array=[255,130,568,415,15];
		public var smallBoxDimentionsArr:Array=[30,170,195,105,15];

		public function HighLight() {
			setInitOutlines();
		}

		public function setInitOutlines():void {
			drawCanvesOutline(canvesBoxDimentionsArr,4);
			drawLittleViewOutlines(smallBoxDimentionsArr,4);
		}


		public function drawLittleViewOutlines(dimentions:Array , lineWidth:Number):void{
			smallBox = new Sprite();
			addChild(smallBox);
			smallBox.graphics.lineStyle(lineWidth,0xfd0000);
			smallBox.graphics.drawRoundRect(dimentions[0],dimentions[1],dimentions[2],dimentions[3],dimentions[4]);
			smallBox.graphics.endFill();
			TweenLite.from(smallBox, 1, {alpha:0});//alpha in the thumbnails
		}


		public function drawCanvesOutline(dimentions:Array , lineWidth:Number):void {
			bigBox = new Sprite();
			addChild(bigBox);
			bigBox.graphics.lineStyle(lineWidth,0xfd0000);
			bigBox.graphics.drawRoundRect(dimentions[0],dimentions[1],dimentions[2],dimentions[3],dimentions[4]);
			bigBox.graphics.endFill();
			TweenLite.from(bigBox, 1, {alpha:0});//alpha in the thumbnails
		}



	}//$class
}//$package