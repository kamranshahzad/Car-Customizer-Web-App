package com.main{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.*;
	import flash.display.Loader;
	import flash.net.URLRequest;

	import com.greensock.*;
	import com.greensock.easing.*;

	import gs.TweenLite;
	import gs.OverwriteManager;


	public class Help extends MovieClip {
		
		public var helpLoader:Loader;
		public var helpMC:MovieClip;
		public var layer:MovieClip;
		
		public function Help() {
			loadHelp(Main.swfsPath + "HELP_UI.swf");
		}
		
		public function loadHelp(url:String) {
			helpLoader = new Loader();
			helpLoader.load(new URLRequest(url));
			helpLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, helpLoaded );
		}
		
		public function helpLoaded(e:Event):void {
			helpMC = new MovieClip();
			helpMC = e.currentTarget.content as MovieClip;
			
			layer = new MovieClip();
			layer.graphics.lineStyle(1, 0x0060ff);
			layer.graphics.beginFill(0x000000);
			layer.graphics.drawRect(0,0,1200,800);
			layer.graphics.endFill();
			layer.alpha = 0;
			
			addChild(layer);
			addChild(helpMC);
			helpMC.x = 0;
			helpMC.y = 0;

			helpMC.close_btn.addEventListener(MouseEvent.CLICK, helpCloseHandler );
		}
		
		public function helpCloseHandler(e:MouseEvent):void{
			MovieClip(parent).destroyHelp();
		}

	}//$class
}//$package