package com.kam{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class MCDragger {
		
		public function MCDragger(){}
		
		public function initDragger(mc:MovieClip):void {
			mc.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			mc.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}

		public function mouseDownHandler(e:MouseEvent):void {
			e.currentTarget.startDrag();
		}
		public function mouseUpHandler(e:MouseEvent):void {
			e.currentTarget.stopDrag();
		}

	}// $MCDragger
}