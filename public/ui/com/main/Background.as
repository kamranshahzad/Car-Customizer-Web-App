package com.main{
	
	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.*;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	import gs.TweenLite;
	import gs.OverwriteManager;
	
	
	public class Background extends MovieClip{
		
		public var bgObj:backGround;
		
		public function Background(){
			bgObj = new backGround();
			addChild(bgObj);
			bgObj.x = 600;
			bgObj.y = 422;
			
			bgObj.help_btn.addEventListener(MouseEvent.CLICK, helpOutHandler);
			bgObj.doneBtn.addEventListener(MouseEvent.CLICK, dealDoneHandler);
		}
		
		public function helpOutHandler(e:MouseEvent):void{
			MovieClip(parent).buildHelp();
		}
		
		public function dealDoneHandler(e:MouseEvent):void{
			MovieClip(parent).buildDealDone();
		}
		
		
		
		
		
		
		
	} //$class
} //$package