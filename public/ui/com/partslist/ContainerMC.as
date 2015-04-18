package com.partslist{

	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.text.*;

	import flash.net.NetConnection;
	import flash.net.Responder;

	import com.main.*;
	import com.ddlist.*;
	import com.cart.*;
	import com.parts.*;
	import com.preloader.Preloader;
	import com.adobe.serialization.json.JSON;



	public class ContainerMC extends MovieClip {

		//MovieClip(parent.parent.parent.parent.parent.parent)    MAIN Access
		//MovieClip(parent.parent.parent)                         PartList
		public var partMC:PartMC;
		public var cart:Cart;
		public var tipMC:ThumbMC;
		public var preloader:Preloader;
		public var outline:MovieClip;
		public var imgMC:MovieClip;
		public var loader:Loader;
		public var path:String='';

		public var partCls:Parts;
		public var wheelCls:Wheels;

		public var swapEleArr:Array;

		public var xPosCoordinate:Number=50;
		public var yPosCoordinate:Number=50;


		// db action values 
		
		public static var PARTID:Number=0;
		public static var PARTLBL:String = 'Lbl';
		public static var PARTPRICE:Number=0;
		public static var MONTHLYPRICE:Number=0;
		public static var PARTFROM:String='';
		public static var PARTTYPE:String='';
		public static var ISSET:String='';
		public static var APPLIED:Number = 0;

		public function ContainerMC($part_id:Number,$icon:String,$lbl:String,$price:Number,$monthlyPrice:Number,$des:String,$manu:String,$SKU:String,$status:Number,$effected:Number,$from:String,$isset:String='') {
			partMC =new PartMC  ;
			partMC.PART_ID=$part_id;
			partMC.FROM=$from;
			partMC.isEffected=$effected;
			if ($isset!='') {
				partMC.IS_SET=$isset;
			} else {
				partMC.IS_SET='_blank';
			}
			partMC.name    	 = $from+$part_id;
			partMC.imgSrc  	 = $icon;
			partMC.partlbl 	 = $lbl;
			partMC.partPrice = $price;
			partMC.montlyPartPrice = $monthlyPrice;
			partMC.partDescription = $des;
			partMC.partManufacture = $manu;
			partMC.partSKU 	 = $SKU;
			partMC.partStatus = $status;
			partMC.graphics.lineStyle(2,0xcdcdcd);
			partMC.graphics.beginFill(0xFFFFFF);
			partMC.graphics.drawRoundRect(0,0,170,133,15,15);
			partMC.graphics.endFill();
			addChild(partMC);

			path = Main.accessoriesIconFiles;

			partMC.buttonMode=true;
			partMC.addEventListener(MouseEvent.CLICK,clickHandler);
			partMC.addEventListener(MouseEvent.MOUSE_OVER,createToolTip);
			partMC.addEventListener(MouseEvent.MOUSE_OUT,removeToolTip);

			setImages(path+$icon);
			setLabelText($lbl);
			setPriceText($price,$monthlyPrice);

			//trace($dealType);

			if (Main.dealType=='payment') {
				setTotalPrice($price);
			}

		}


		/*   Other functions     */



		public function removeSelected():void {
			//partMC.removeChild(outline);
		}


		public function clickHandler(e:MouseEvent):void {
			
			
			
			var aid:Number=0;
			var part_id:Number=e.currentTarget.PART_ID;
			PARTID       = e.currentTarget.PART_ID;
			PARTLBL      = e.currentTarget.partlbl;
			PARTPRICE    = e.currentTarget.partPrice;
			PARTFROM     = e.currentTarget.FROM;
			ISSET        = e.currentTarget.IS_SET;
			MONTHLYPRICE = e.currentTarget.montlyPartPrice; 
			APPLIED      = e.currentTarget.isEffected;
			
			//trace('AID=====>' + e.currentTarget.AID);
			
			if (e.currentTarget.FROM=='wheel') {
				if (MovieClip(parent.parent.parent.parent.parent.parent).wheelID != 0) {
					MovieClip(parent.parent.parent.parent.parent.parent).cartCls.removeProductItem('ww'+MovieClip(parent.parent.parent.parent.parent.parent).wheelID );
					MovieClip(parent.parent.parent.parent.parent.parent).removeWheel(MovieClip(parent.parent.parent.parent.parent.parent).wheelID);
				}
				if (e.currentTarget.isEffected==1) {
					MovieClip(parent.parent.parent.parent.parent.parent).addWheel(part_id);
				}
			} else {
				if (e.currentTarget.IS_SET == 'Y' ) {// 'isEffected' will see by parts
					MovieClip(parent.parent.parent.parent.parent).setID = part_id;
					MovieClip(parent.parent.parent.parent.parent).getPartsSet(part_id);
				} else {
					// checks for swappers
					if (Main.SWAP_SET != '') {
						if (findInSwapSets(part_id)!='') {
							var foundArr:Array = getSwapSetItems(findInSwapSets(part_id));
							foundArr.splice(foundArr.indexOf(part_id),1);
							var difference:Array = findMatches(MovieClip(parent.parent.parent.parent.parent).PartsArr,foundArr);
							for ( var q:Number=0; q < difference.length; q++ ) {
								MovieClip(parent.parent.parent.parent.parent).removePart( difference[q] );
								MovieClip(parent.parent.parent.parent.parent).cartCls.removeProductItem('pp'+difference[q] );
							}
						}
					}
					if ( e.currentTarget.isEffected==1 ) {
						if(MovieClip(parent.parent.parent.parent.parent).setOfPartsArr.length > 0){
							if(MovieClip(parent.parent.parent.parent.parent).setOfPartsArr.indexOf(part_id) == -1){
								MovieClip(parent.parent.parent.parent.parent).addPart(part_id);
							}else{
								trace("Clicked Part Already Exists in Set of Parts");
							}
						}else{
							MovieClip(parent.parent.parent.parent.parent).addPart(part_id);
						}
					}else{
						// part will not apply
						//trace(MovieClip(parent.parent.parent.parent.parent));
						//trace("Simple Part ==> this will added in cart");
						MovieClip(parent.parent.parent.parent.parent).addUneffectedPart(part_id);
					}
				}
			}
			//MovieClip(parent.parent.parent.parent.parent).updatePartsStates();
		}

		
		public function doIt(part_name:String):void {
			
			//trace(  MovieClip(this.getChildByName(part_name)) );
			//var btn:MovieClip= MovieClip(MovieClip(parent.).getChildByName(part_name));
			//trace("Here::=>"+btn);
			
			
			/*
			if(btn){
				btn.DisplayOutline();
				btn.mouseEnabled=false;
				btn.mouseChildren=false;
			}*/
		}
		
		function createToolTip(event:MouseEvent):void {
			if (!tipMC) {
				with (event.currentTarget) {
					var img:String=path+imgSrc;
					tipMC=new ThumbMC(img,partlbl,partPrice,partManufacture,partSKU,partDescription,partStatus);
					tipMC.x=260;
					tipMC.y=-290;
					EffectedParts.toolContainer.addChild(tipMC);
				}
			}
		}


		function removeToolTip(event:MouseEvent):void {
			if (tipMC) {
				EffectedParts.toolContainer.removeChild(tipMC);
				tipMC=null;
			}
		}


		

		/*
		************************************************************************************************************
		Helpers 
		*/
	

		public function findInSwapSets($key):String {
			var parentArr:Array=JSON.decode(Main.SWAP_SET);
			var temp:String='';
			for (var p:Number=0; p<parentArr.length; p++) {
				for (var val:* in parentArr[p]) {
					for (var q:Number=0; q<parentArr[p][val].length; q++) {
						if (parentArr[p][val][q].ID==$key) {
							//swapEleArr = getSwapSetItems(val);
							temp=val;
						}
					}
				}
			}
			return temp;
		}
		
		
		public function getSwapSetItems($setLabel:String):Array {
			var tempArr:Array=new Array  ;
			var parentArr:Array=JSON.decode(Main.SWAP_SET);
			for (var p:Number=0; p < parentArr.length; p++) {
				for (var val:* in parentArr[p]) {
					if (val==$setLabel) {
						for (var q:Number=0; q < parentArr[p][val].length; q++) {
							tempArr.push(parentArr[p][val][q].ID);
						}
					}
				}
			}
			return tempArr;
		}


		
		/*  
		***********************************************************************************************************
		Draw Movieclips
		*/

		public function setTotalPrice(txt:Number):void {
			var totalPrice:TextField=new TextField  ;
			totalPrice.selectable=false;
			totalPrice.text="Price: $"+String(txt);
			totalPrice.height=20;
			totalPrice.x=5;
			totalPrice.y=115;
			partMC.addChild(totalPrice);
			totalPrice.setTextFormat(PartTextFormat.monthlyPriceStyle());
		}


		public function setLabelText(txt:String):void {
			var lblTxt:TextField=new TextField  ;
			lblTxt.selectable=false;
			lblTxt.text=txt;
			lblTxt.x=5;
			lblTxt.y=85;
			lblTxt.width=160;
			lblTxt.height=20;
			partMC.addChild(lblTxt);
			lblTxt.setTextFormat(PartTextFormat.setPartLabelStyle());
		}

		public function setPriceText(totalPrice:Number=0,monthlyPrice:Number=0):void {
			var priceTxt:TextField=new TextField  ;
			priceTxt.selectable=false;
			if (Main.dealType=='cash') {
				priceTxt.text="$"+String(totalPrice);
			} else {
				priceTxt.text="$"+String(monthlyPrice)+"/mo.";
			}

			priceTxt.height=22;
			priceTxt.x=3;
			priceTxt.y=100;
			partMC.addChild(priceTxt);
			priceTxt.setTextFormat(PartTextFormat.setPartPriceStyle());
		}


		function setImages(url:String):void {
			imgMC=new MovieClip  ;
			loadImage(url);
		}

		function loadImage(url:String):void {
			loader=new Loader  ;
			loader.contentLoaderInfo.addEventListener(Event.INIT,imageLoaded);
			loader.load(new URLRequest(url));
		}

		function imageLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			imgMC.addChild(thumbContent);
			imgMC.x=1;
			imgMC.y=1;
			partMC.addChild(imgMC);
			loader.unload();
			resizeMe(imgMC,170,87,false);
		}

		function resizeMe(mc:MovieClip,maxW:Number,maxH:Number=0,constrainProportions:Boolean=true):void {
			maxH=maxH==0?maxW:maxH;
			mc.width=maxW;
			mc.height=maxH;
			if (constrainProportions) {
				mc.scaleX<mc.scaleY?mc.scaleY=mc.scaleX:mc.scaleX=mc.scaleY;
			}
		}


		/* Debug Mode */
		public function getSetInfo():void {
			//trace(MovieClip(parent.parent.parent.parent.parent).setOfPartsArr.length);
		}

		public function debug($mc:MovieClip):void {
			trace("-----------------------------------------------------------------------------------------------------");
			for (var i:uint=0; i<$mc.numChildren; i++) {
				trace(i+'.\t name:'+$mc.getChildAt(i).name+'\t type:'+typeof $mc.getChildAt(i)+'\t'+$mc.getChildAt(i));
			}
		}

		private function findMatches(arr1, arr2):Array {
			var bothArr:Array = new Array();
			for (var i:int=0; i<arr1.length; i++) {
				for (var j:int=0; j<arr2.length; j++) {
					if (arr1[i]==arr2[j]) {
						bothArr.push(arr1[i]);
						break;
					}
				}
			}
			return (bothArr);//send the array back
		}

		/*
		printStuff=function(object){
		    for(var x in object){
		        if(typeof(object[x])=="movieclip"){
		            trace(object[x]);
		            printStuff(object[x]);
		        }
		    }
		};
		printStuff(_root);
		
		
		function showChildren(dispObj:DisplayObject):void {
		for (var i:uint = 0; i < dispObj.numChildren; i++) {
		var obj:DisplayObject = dispObj.getChildAt(i)
		if (obj is DisplayObjectContainer) {
		trace(obj.name, obj);
		showChildren(obj);
		} else {
		trace(obj);
		}
		}
		}
		
		showChildren(stage);
		*/


	}//$class
}//$package