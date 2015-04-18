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

		public var primaryIndex:Number=0;
		public var swapEleArr:Array;

		public var xPosCoordinate:Number=50;
		public var yPosCoordinate:Number=50;


		// db action values 
		public var AID:Number=0;
		public var PARTID:Number=0;
		public var PARTLBL:String='';
		public var PARTPRICE:Number=0;
		public var PARTFROM:String='';
		public var PARTTYPE:String='';
		public var ISSET:String='';
		public var APPLIED:Number = 0;

		public function ContainerMC($part_id:Number,$icon:String,$lbl:String,$price:Number,$monthlyPrice:Number,$des:String,$manu:String,$SKU:String,$status:Number,$effected:Number,$from:String,$isset:String='') {
			partMC=new PartMC  ;
			partMC.PART_ID=$part_id;
			partMC.FROM=$from;
			partMC.isEffected=$effected;
			if ($isset!='') {
				partMC.IS_SET=$isset;
			} else {
				partMC.IS_SET='_blank';
			}
			partMC.name=$from+$part_id;
			partMC.imgSrc=$icon;
			partMC.partlbl=$lbl;
			partMC.partPrice=$price;
			partMC.montlyPartPrice=$monthlyPrice;
			partMC.partDescription=$des;
			partMC.partManufacture=$manu;
			partMC.partSKU=$SKU;
			partMC.partStatus=$status;
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

			this.addEventListener("listCompleteEvent", listCompleteHandler);
			// Load Deals
			//loadDeals(1);


		}



		public function loadDeals($deal_id:Number):void {
			loadDealPartsInfo($deal_id,'p');
			loadDealWheelsInfo($deal_id,'w');
		}






		/*   Other functions     */



		public function removeSelected():void {
			//partMC.removeChild(outline);
		}


		function clickHandler(e:MouseEvent):void {
			
			
			
			
			
			var aid:Number=0;

			var part_id:Number=e.currentTarget.PART_ID;

			if (e.currentTarget.FROM=='wheel') {
				if (MovieClip(parent.parent.parent.parent.parent.parent).WheelArr.length>0) {
					MovieClip(parent.parent.parent.parent.parent.parent).cartCls.removeProductItem('ww'+MovieClip(parent.parent.parent.parent.parent.parent).WheelArr[0] );
					removeWheel(MovieClip(parent.parent.parent.parent.parent.parent).WheelArr[0] , MovieClip(parent.parent.parent.parent.parent.parent).pAidArr[0] );
				}
				if (e.currentTarget.isEffected==1) {
					addWheel(part_id);
				}
			} else {
				if (e.currentTarget.IS_SET=='Y') {// 'isEffected' will see by parts
					primaryIndex = part_id;
					getPartsSet(part_id);
				} else {
					// checks for swappers
					if (Main.SWAP_SET != '') {
						if (findInSwapSets(part_id)!='') {
							var foundArr:Array=getSwapSetItems(findInSwapSets(part_id));
							foundArr.splice(foundArr.indexOf(part_id),1);
							var difference:Array=findMatches(MovieClip(parent.parent.parent.parent.parent).PartsArr,foundArr);
							for (var q:Number=0; q < difference.length; q++) {
								removePart(difference[q]);
								MovieClip(parent.parent.parent.parent.parent).cartCls.removeProductItem('pp'+difference[q] );
							}
						}
					}
					if (e.currentTarget.isEffected==1) {
						addPart(part_id);
					}
				}
				//MovieClip(parent.parent.parent.parent.parent).cartCls.addProduct(part_id,e.currentTarget.partlbl,e.currentTarget.partPrice,e.currentTarget.FROM,e.currentTarget.IS_SET,e.currentTarget.isEffected , AID);
			}
			PARTID    = e.currentTarget.PART_ID;
			PARTLBL   = e.currentTarget.partlbl;
			PARTPRICE = e.currentTarget.partPrice;
			PARTFROM  = e.currentTarget.FROM;
			ISSET     = e.currentTarget.IS_SET;
			APPLIED   = e.currentTarget.isEffected;
		}


		public function listCompleteHandler(e:ListCompleteEvent):void {
			//addProduct($partID:Number , $lblStr:String , $price:Number , $from:String , $isset:String , $applied:Number , $AID:Number);
			if(PARTFROM == 'wheel'){
				MovieClip(parent.parent.parent.parent.parent.parent).cartCls.addProduct( PARTID , PARTLBL , PARTPRICE , PARTFROM ,ISSET , APPLIED ,AID);
				MovieClip(parent.parent.parent.parent.parent.parent).pAidArr.push(AID);
			}else{
				MovieClip(parent.parent.parent.parent.parent).cartCls.addProduct( PARTID , PARTLBL , PARTPRICE , PARTFROM ,ISSET , APPLIED ,AID);
			}
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
		Build Parts
		*/
		public function buildPartsSet($setVals:String):void {
			var setElementArr=$setVals.split(',');
			var setObj:Object=new Object  ;
			var idsArr:Array=new Array  ;
			for (var i:Number=0; i<setElementArr.length; i++) {
				if (setElementArr[i]!='') {
					var obj:Object=new Object  ;
					var elemArr:Array = setElementArr[i].split('-'); 
					var $pid:Number = elemArr[0];
					obj.PID 		  = $pid;
					obj.APPLIED 	  = elemArr[4];
					obj.PLBL		  = elemArr[1];
					obj.PRICE1	      = elemArr[2];
					obj.PRICE2	      = elemArr[3];
					idsArr.push(obj);
					if( MovieClip(parent.parent.parent.parent.parent).PartsArr.indexOf($pid) == -1){
						addPart($pid);
					}else{
						//removePart($pid);
						MovieClip(parent.parent.parent.parent.parent).PartsArr.splice(MovieClip(parent.parent.parent.parent.parent).PartsArr.indexOf($pid),1);
						//addPart($pid);
					}
				}
			}
			setObj[primaryIndex] = idsArr;
			MovieClip(parent.parent.parent.parent.parent).setOfPartsArr.push(setObj);
		}
		
		public function addPart($part_id):void {
			partCls=new Parts($part_id);
			partCls.name=String('p'+$part_id);
			EffectedParts.shopContainer.addChild(partCls);
			partCls.x=xPosCoordinate;
			partCls.y=yPosCoordinate;
			partCls.applyPart($part_id);
			MovieClip(parent.parent.parent.parent.parent).PartsArr.push($part_id);
			insertInDeal('p',$part_id);
		}

		public function removePart($part_id):void {
			EffectedParts.shopContainer.removeChild(EffectedParts.shopContainer.getChildByName('p'+$part_id));
			MovieClip(parent.parent.parent.parent.parent).PartsArr.splice(MovieClip(parent.parent.parent.parent.parent).PartsArr.indexOf($part_id),1);
		}

		public function addWheel($wheel_id):void {
			wheelCls = new Wheels($wheel_id);
			wheelCls.name=String('w'+$wheel_id);
			EffectedParts.shopContainer.addChild(wheelCls);
			wheelCls.x = xPosCoordinate;
			wheelCls.y = yPosCoordinate;
			wheelCls.applyWheels($wheel_id);
			MovieClip(parent.parent.parent.parent.parent.parent).WheelArr.push($wheel_id);
			insertInDeal('w', $wheel_id );
		}

		public function removeWheel($wheel_id , $aid ):void {
			EffectedParts.shopContainer.removeChild(EffectedParts.shopContainer.getChildByName('w'+$wheel_id));
			MovieClip(parent.parent.parent.parent.parent.parent).WheelArr.splice(MovieClip(parent.parent.parent.parent.parent.parent).WheelArr.indexOf($wheel_id),1);
			MovieClip(parent.parent.parent.parent.parent.parent).pAidArr.splice(MovieClip(parent.parent.parent.parent.parent.parent).pAidArr.indexOf($aid),1);
			removeFrmDeal( $aid , 'w' );
		}


		/*
		************************************************************************************************************
		Helpers 
		*/
		
		public function updatePartsStates():void{
			if(MovieClip(parent.parent.parent.parent.parent).PartsArr.length > 0){
				for(var i:Number = 0; i < MovieClip(parent.parent.parent.parent.parent).PartsArr.length; i++){
					doIt('part'+MovieClip(parent.parent.parent.parent.parent).PartsArr[i]); 
				}
			}
		}
		
		public function doIt(part_name:String):void {
			var btn:MovieClip=MovieClip(this.getChildByName(part_name));
			if(btn){
				btn.DisplayOutline();
				btn.mouseEnabled=false;
				btn.mouseChildren=false;
			}
		}

		public function undoIt(part_name:String):void {
			var btn:MovieClip=MovieClip(this.getChildByName(part_name));
			if(btn){
				btn.DisplayOutline();
				btn.mouseEnabled=true;
				btn.mouseChildren=true;
			}
		}

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
		************************************************************************************************************
		Remoting
		*/
		public function getPartsSet($part_id:Number) {
			var _service=new NetConnection  ;
			_service.connect(Main.gateWay);
			var responder=new Responder(get_parts_set,onFault);
			_service.call("AddOnCars.getPartsSet",responder,$part_id);
		}
		public function get_parts_set(rs:Object) {
			buildPartsSet(rs.serverInfo.initialData[0][1]);
		}


		public function insertInDeal(part_type:String,part_id:Number,deal_id:Number=1):void {
			var _service=new NetConnection  ;
			_service.connect(Main.gateWay);
			var responder=new Responder(get_insert_deal,onFault);
			_service.call("AddOnCars.insertPartInDeal",responder,deal_id,part_type,part_id);
		}
		public function get_insert_deal(rs:Object) {
			AID = Number(rs);
			this.dispatchEvent(new ListCompleteEvent  );
		}


		public function loadDealPartsInfo(deal_id:Number,type:String):void {
			var _service=new NetConnection  ;
			_service.connect(Main.gateWay);
			var responder=new Responder(get_deal_part_info,onFault);
			_service.call("AddOnCars.getDealPartsInfo",responder,deal_id,type);
		}
		public function get_deal_part_info(rs:Object) {
		}

		public function loadDealWheelsInfo(deal_id:Number,type:String):void {
			var _service=new NetConnection  ;
			_service.connect(Main.gateWay);
			var responder=new Responder(get_deal_wheel_info,onFault);
			_service.call("AddOnCars.getDealWheelInfo",responder,deal_id,type);
		}
		public function get_deal_wheel_info(rs:Object) {
		}
		
		public function removeFrmDeal($aid:Number , $part_type:String):void {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_remove_deal,onFault);
			_service.call("AddOnCars.removePartFrmDeal", responder , $aid ,$part_type);
		}

		public function get_remove_deal(rs:Object) {
			//trace(rs);
		}
		

		public function onFault(f:Event) {
			trace("There was a problem");
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