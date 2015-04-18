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
	import gs.easing.Circ;


	public class Tabs extends MovieClip {
		
		
		public static var activeTabState:Number 	= 1;   // set default exteriorTab value
		public var exteriorTabValue:Number  = 1;
		public var wheelTabValue:Number 	= 2;
		public var interiorTabValue:Number  = 3;
		public var otherTabValue:Number 	= 4;
		public var tabObj:tabsContainer;
		
		
		public function Tabs() {

			tabObj = new tabsContainer();
			addChild(tabObj);
			tabObj.x=400;
			tabObj.y=547;


			// SET BUTTON att
			tabObj.exteriorTab.buttonMode=true;
			tabObj.wheelTab.buttonMode=true;
			tabObj.interiorTab.buttonMode=true;
			tabObj.otherTab.buttonMode=true;


			//tabs event handlers
			tabObj.exteriorTab.addEventListener(MouseEvent.CLICK, exteriorTabClick);
			tabObj.exteriorTab.addEventListener(MouseEvent.MOUSE_OVER, exteriorTabOver);
			tabObj.exteriorTab.addEventListener(MouseEvent.MOUSE_OUT, exteriorTabOut);

			tabObj.wheelTab.addEventListener(MouseEvent.CLICK, wheelTabClick);
			tabObj.wheelTab.addEventListener(MouseEvent.MOUSE_OVER, wheelTabOver);
			tabObj.wheelTab.addEventListener(MouseEvent.MOUSE_OUT, wheelTabOut);

			tabObj.interiorTab.addEventListener(MouseEvent.CLICK, interiorTabClick);
			tabObj.interiorTab.addEventListener(MouseEvent.MOUSE_OVER, interiorTabOver);
			tabObj.interiorTab.addEventListener(MouseEvent.MOUSE_OUT, interiorTabOut);

			tabObj.otherTab.addEventListener(MouseEvent.CLICK, otherTabClick);
			tabObj.otherTab.addEventListener(MouseEvent.MOUSE_OVER, otherTabOver);
			tabObj.otherTab.addEventListener(MouseEvent.MOUSE_OUT, otherTabOut);
			
			
			updateTabStates(activeTabState);
		}


		function exteriorTabClick(e:MouseEvent) {
			
			activeTabState=exteriorTabValue;
			updateTabStates(activeTabState);
			

			//populate categories
			MovieClip(parent.parent.parent).listCls.removeSimpleList();
			MovieClip(parent.parent.parent).listCls.removeWheelSizeList();
			MovieClip(parent.parent.parent).listCls.createSimpleList(1);
			
			MovieClip(parent).viewCls.frontViewBT();
		}
		function wheelTabClick(e:MouseEvent) {
			
			activeTabState=wheelTabValue;
			updateTabStates(activeTabState);
			
			//populate categories
			MovieClip(parent.parent.parent).listCls.removeSimpleList();
			MovieClip(parent.parent.parent).listCls.removeWheelSizeList();
			MovieClip(parent.parent.parent).listCls.createWheelSizeList();
			
			MovieClip(parent).viewCls.frontViewBT();
		}
		function interiorTabClick(e:MouseEvent) {
			
			activeTabState=interiorTabValue;
			updateTabStates(activeTabState);
			
			//populate categories
			MovieClip(parent.parent.parent).listCls.removeSimpleList();
			MovieClip(parent.parent.parent).listCls.removeWheelSizeList();
			MovieClip(parent.parent.parent).listCls.createSimpleList(3);
			
			MovieClip(parent).viewCls.interiorViewBT();
		}
		function otherTabClick(e:MouseEvent) {
			
			activeTabState=otherTabValue;
			updateTabStates(activeTabState);
			
			//populate categories
			MovieClip(parent.parent.parent).listCls.removeSimpleList();
			MovieClip(parent.parent.parent).listCls.removeWheelSizeList();
			MovieClip(parent.parent.parent).listCls.createSimpleList(4);
			
			MovieClip(parent).viewCls.otherViewBT();
		}

		function updateTabStates(_activeTab:Number) {
			switch (_activeTab) {
				case 1 :
					tabObj.exteriorTab.gotoAndStop(2);
					tabObj.wheelTab.gotoAndStop(1);
					tabObj.interiorTab.gotoAndStop(1);
					tabObj.otherTab.gotoAndStop(1);
					break;
				case 2 :
					tabObj.exteriorTab.gotoAndStop(1);
					tabObj.wheelTab.gotoAndStop(2);
					tabObj.interiorTab.gotoAndStop(1);
					tabObj.otherTab.gotoAndStop(1);
					break;
				case 3 :
					tabObj.exteriorTab.gotoAndStop(1);
					tabObj.wheelTab.gotoAndStop(1);
					tabObj.interiorTab.gotoAndStop(2);
					tabObj.otherTab.gotoAndStop(1);
					break;
				case 4 :
					tabObj.exteriorTab.gotoAndStop(1);
					tabObj.wheelTab.gotoAndStop(1);
					tabObj.interiorTab.gotoAndStop(1);
					tabObj.otherTab.gotoAndStop(2);
					break;
			}
		}


		//  ROLLOVERs


		function exteriorTabOver(e:MouseEvent) {
			TweenLite.to(tabObj.exteriorTab, .5, {alpha:.6});
		}
		function exteriorTabOut(e:MouseEvent) {
			TweenLite.to(tabObj.exteriorTab, .5, {alpha:1});
		}
		function wheelTabOver(e:MouseEvent) {
			TweenLite.to(tabObj.wheelTab, .5, {alpha:.6});
		}
		function wheelTabOut(e:MouseEvent) {
			TweenLite.to(tabObj.wheelTab, .5, {alpha:1});
		}
		function interiorTabOver(e:MouseEvent) {
			TweenLite.to(tabObj.interiorTab, .5, {alpha:.6});
		}
		function interiorTabOut(e:MouseEvent) {
			TweenLite.to(tabObj.interiorTab, .5, {alpha:1});
		}
		function otherTabOver(e:MouseEvent) {
			TweenLite.to(tabObj.otherTab, .5, {alpha:.6});
		}
		function otherTabOut(e:MouseEvent) {
			TweenLite.to(tabObj.otherTab, .5, {alpha:1});
		}





	}//$class
}//$package