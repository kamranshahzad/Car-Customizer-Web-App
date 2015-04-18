package com.partslist{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.display.Loader;
	import flash.display.DisplayObject;
	import flash.events.ProgressEvent;
	
	import com.main.*;
	import com.parts.*;
	import com.ddlist.*;
	import caurina.transitions.Tweener;


	public class PartList extends MovieClip {
		
		public var containerMCls:MovieClip;
		
		
		public var changey:int=0;
		public var margin:int=10;
		public var MCArray:Array;
		public var bool:Boolean=false;
		public var p:Number=0;
		var thumbLoader:Loader;

		// data from outside
		public var iconPath:String="";
		public var iconsArr:Array;
		public var part_id_Arr:Array;
		public var priceArr:Array;
		public var monthlyPriceArr:Array;
		public var descriptionArr:Array;
		public var labelsArr:Array;
		public var manufactureArr:Array;
		public var SKUArr:Array;
		public var statusArr:Array;
		public var PRIVIEWArr:Array;
		public var ISSETArr:Array;
		
		
		public var FROM:String = '';  // which type is called

		
		public var folowingMouse:Boolean=false;
		public var listmasker:Sprite;

		public var simpleLstObj:SimpleList;
		public var scrollMC:ScollBar;
		public static var scrollListContainer:MovieClip;
		public var listMC:MovieClip;
		


		// Constructor
		public function PartList( $part_id:Array , $iconsArr:Array,$priceArr:Array, $monthlyPriceArr:Array,$desArr:Array, $lblArr:Array, $manuArr:Array , $SKUArr:Array , $statusArr:Array , $effectedArr:Array , $from:String , $isSet:Array = null ) {// construtors
			
			scrollListContainer = new MovieClip();
			scrollListContainer.name="listContainer";
			scrollListContainer.x=200;//200
			scrollListContainer.y=70;
			addChild(scrollListContainer);

			FROM 		= $from;
			part_id_Arr = $part_id;
			iconsArr	= $iconsArr;
			priceArr	=	$priceArr;
			monthlyPriceArr = $monthlyPriceArr;
			descriptionArr=$desArr;
			labelsArr	=	$lblArr;
			manufactureArr	=	$manuArr;
			SKUArr	=	$SKUArr;
			statusArr	=	$statusArr;
			PRIVIEWArr	=	$effectedArr;
			if($isSet != null){
				ISSETArr = $isSet;
			}else{
				ISSETArr = null;
			}
			
			loadPartsInList();
		}

		public function loadPartsInList():void {
			listMC = new MovieClip();
			listMC.name = "listMC";
			for (var n:Number = 0; n < iconsArr.length; n++) {
				if(ISSETArr != null){
					containerMCls = new ContainerMC(part_id_Arr[n],iconsArr[n],labelsArr[n],priceArr[n],monthlyPriceArr[n],descriptionArr[n],manufactureArr[n],SKUArr[n],statusArr[n],PRIVIEWArr[n] , FROM , ISSETArr[n]);
				}else{
					containerMCls = new ContainerMC(part_id_Arr[n],iconsArr[n],labelsArr[n],priceArr[n],monthlyPriceArr[n],descriptionArr[n],manufactureArr[n],SKUArr[n],statusArr[n],PRIVIEWArr[n] , FROM );
				}
				containerMCls.x = changey;
				changey  = changey + containerMCls.width + margin;
				listMC.addChild(containerMCls);
			}
			scrollListContainer.addChild(listMC);
			listMC.x = 2;
			if(iconsArr.length > 5){
				drawMaskArea();
				loadScrollBar();
			}
		}

		public function drawMaskArea():void {
			listmasker = new Sprite();
			listmasker.graphics.lineStyle(1, 0x717171);
			listmasker.graphics.beginFill(0xc1c1c1);
			listmasker.graphics.drawRect(0,0,950,140);
			listmasker.graphics.endFill();
			listmasker.x=0;
			listmasker.y=-2;
			scrollListContainer.addChild(listmasker);
		}

		public function loadScrollBar():void {
			scrollMC = new ScollBar();
			scrollListContainer.addChild(scrollMC);
			scrollMC.x=485;
			scrollMC.y=150;
			listMC.mask = listmasker;
			scrollMC.Scoll_dragger.buttonMode=true;
			scrollMC.Scoll_dragger.addEventListener(MouseEvent.MOUSE_DOWN, followMouse);
		}

		/*  Dragger Process */
		public function followMouse(e:MouseEvent):void {
			folowingMouse=true;
			this.stage.addEventListener(MouseEvent.MOUSE_UP, relaxMouse);
			this.addEventListener(Event.ENTER_FRAME, updatePosition);
		}
		public function relaxMouse(e:MouseEvent):void {
			folowingMouse=false;
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, relaxMouse);
			this.removeEventListener(Event.ENTER_FRAME, updatePosition);
		}
		
		public function updatePosition(e:Event):void {
			if (folowingMouse=true) {
				
				var mouseXposition:int= (mouseX - scrollMC.Scoll_Bg.x) - 686 ;      // define boundaries
				
				if (mouseXposition <=  (scrollMC.Scoll_dragger.width / 2)) {
					mouseXposition = (scrollMC.Scoll_dragger.width / 2);
				} else if (mouseXposition >= scrollMC.Scoll_Bg.width - (scrollMC.Scoll_dragger.width / 2)) {
					mouseXposition = (scrollMC.Scoll_Bg.width - scrollMC.Scoll_dragger.width/2);
				}
				
				
				var mad:int;
				if (mouseX<=listmasker.x) {
					mad=listmasker.x;
				} else if (mouseX >= listmasker.x + listmasker.width) {
					mad=listmasker.x+listmasker.width;
				} else {
					mad=mouseX;
				}
				
				
				mad *= -( listmasker.x + (listMC.width) - listmasker.width) / listmasker.width  ;
				Tweener.addTween(listMC, { x:listmasker.x + scrollMC.Scoll_dragger.width/2 + mad - 10, time:0.1, transition:"linear" } );
				Tweener.addTween( scrollMC.Scoll_dragger, { x:(mouseXposition + scrollMC.Scoll_Bg.x - (scrollMC.Scoll_dragger.width / 2)), time:.1, transition:"linear" } );

			} else {
				this.stage.removeEventListener(MouseEvent.MOUSE_UP, relaxMouse);
				this.removeEventListener(Event.ENTER_FRAME, updatePosition);
			}
		}

	}// $class
}