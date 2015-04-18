package com.partslist{

	import flash.display.DisplayObject;
	import flash.display.MovieClip;
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
		
		public var primaryIndex:Number = 0;
		
		
		public var xPosCoordinate:Number = 50;
		public var yPosCoordinate:Number = 50;
		
		
		// db action values 
		public var AID:Number=0;
		public var PARTID:Number=0;
		public var PARTLBL:String='';
		public var PARTPRICE:Number=0;
		public var PARTFROM:String='';
		public var PARTTYPE:String='';

		public function ContainerMC($part_id:Number,$icon:String,$lbl:String,$price:Number,$monthlyPrice:Number,$des:String,$manu:String,$SKU:String,$status:Number,$effected:Number , $from:String , $isset:String='' ) {
			partMC = new PartMC();
			partMC.PART_ID=$part_id;
			partMC.FROM=$from;
			partMC.isEffected=$effected;
			if ($isset!='') {
				partMC.IS_SET=$isset;
			} else {
				partMC.IS_SET='_blank';
			}
			partMC.name = $from + $part_id;
			partMC.imgSrc=$icon;
			partMC.partlbl=$lbl;
			partMC.partPrice=$price;
			partMC.montlyPartPrice=$monthlyPrice;
			partMC.partDescription=$des;
			partMC.partManufacture=$manu;
			partMC.partSKU=$SKU;
			partMC.partStatus=$status;
			partMC.graphics.lineStyle(2, 0xcdcdcd);
			partMC.graphics.beginFill(0xFFFFFF);
			partMC.graphics.drawRoundRect(0, 0, 170 , 133 , 15, 15);
			partMC.graphics.endFill();
			addChild(partMC);

			path=Main.accessoriesIconFiles;

			partMC.buttonMode=true;
			partMC.addEventListener(MouseEvent.CLICK , clickHandler);
			partMC.addEventListener(MouseEvent.MOUSE_OVER, createToolTip);
			partMC.addEventListener(MouseEvent.MOUSE_OUT, removeToolTip);

			setImages(path + $icon);
			setLabelText($lbl);
			setPriceText($price ,$monthlyPrice );

			//trace($dealType);

			if (Main.dealType=='payment') {
				setTotalPrice($price);
			}

			//this.addEventListener("listCompleteEvent", listCompleteHandler);



			// Load Deals
			//loadDeals(1);
			

		}



		public function loadDeals($deal_id:Number):void {
			loadDealPartsInfo($deal_id ,'p');
			loadDealWheelsInfo($deal_id, 'w');
		}






		/*   Other functions     */

		

		public function removeSelected():void {
			//partMC.removeChild(outline);
		}


		function clickHandler(e:MouseEvent):void {
			
			//trace("==>"+e.currentTarget.name);
			
			var aid:Number=0;
			//selectedContainer();
			//trace(Main.SWAP_SET);
			//trace(MovieClip(parent.parent.parent.parent.parent.parent.parent));

			
			
			
			if (e.currentTarget.FROM=='wheel') {
				if (e.currentTarget.isEffected==1) {
					
					addWheel(e.currentTarget.PART_ID);
				} else {
					//
				}
				MovieClip(parent.parent.parent.parent.parent).WheelArr.push(e.currentTarget.PART_ID);
			} else {
				if (e.currentTarget.IS_SET=='Y') {// 'isEffected' will see by parts
					primaryIndex = e.currentTarget.PART_ID; 
					getPartsSet(e.currentTarget.PART_ID);
				} else {
					if (e.currentTarget.isEffected==1) {
						
						addPart(e.currentTarget.PART_ID);
					} else {
						//
					}
					MovieClip(parent.parent.parent.parent.parent).PartsArr.push(e.currentTarget.PART_ID);
				}
			}
			Cart.addProduct(e.currentTarget.PART_ID , e.currentTarget.partlbl , e.currentTarget.partPrice ,e.currentTarget.FROM , e.currentTarget.IS_SET , e.currentTarget.isEffected, AID);
			//Cart.getCartInformation();
			
			
			

			/*
			if(ContainerList._listContainer.getChildByName("p"+e.currentTarget.PART_ID) == null ){
			if (ContainerList.currentVIEW=='') {
			partCls=new Parts(e.currentTarget.PART_ID);
			} else {
			partCls=new Parts(e.currentTarget.PART_ID,ContainerList.currentVIEW);
			}
			partCls.name=String('p'+e.currentTarget.PART_ID);
			EffectedParts.newBox.addChildAt(partCls,0);
			partCls.x=-19;
			partCls.y=-17;
			partCls.applyPart(e.currentTarget.PART_ID);
			insertInDeal('p',e.currentTarget.PART_ID);
			}
			*/


			/*
			if (e.currentTarget.FROM == 'wheel' ) {
			if(ContainerList._listContainer.getChildByName("w"+e.currentTarget.PART_ID) == null ){
			if (ContainerList.currentVIEW=='') {
			wheelCls =new Wheels(e.currentTarget.PART_ID);
			} else {
			wheelCls = new Wheels(e.currentTarget.PART_ID,ContainerList.currentVIEW);
			}
			wheelCls.name=String('w'+e.currentTarget.PART_ID);
			ContainerList._listContainer.addChildAt(wheelCls,0);
			wheelCls.x=-19;
			wheelCls.y=-17;
			wheelCls.applyWheels(e.currentTarget.PART_ID);
			insertInDeal('w',e.currentTarget.PART_ID);
			}
			} else {
			if(ContainerList._listContainer.getChildByName("p"+e.currentTarget.PART_ID) == null ){
			if (ContainerList.currentVIEW=='') {
			partCls=new Parts(e.currentTarget.PART_ID);
			} else {
			partCls=new Parts(e.currentTarget.PART_ID,ContainerList.currentVIEW);
			}
			partCls.name=String('p'+e.currentTarget.PART_ID);
			ContainerList._listContainer.addChildAt(partCls,0);
			partCls.x=-19;
			partCls.y=-17;
			partCls.applyPart(e.currentTarget.PART_ID);
			insertInDeal('p',e.currentTarget.PART_ID);
			}
			}
			//Cart.addProduct(e.currentTarget.PART_ID , e.currentTarget.partlbl , e.currentTarget.partPrice ,e.currentTarget.FROM ,AID);
			PARTID = e.currentTarget.PART_ID;
			PARTLBL = e.currentTarget.partlbl;
			PARTPRICE = e.currentTarget.partPrice;
			PARTFROM  = e.currentTarget.FROM;
			*/
		}

		public function listCompleteHandler(e:ListCompleteEvent):void {
			//Cart.addProduct( PARTID , PARTLBL , PARTPRICE , PARTFROM ,AID);
			//trace("added");
		}



		function createToolTip(event:MouseEvent):void {
			if (!tipMC) {
				with (event.currentTarget) {
					var img:String=path+imgSrc;
					tipMC=new ThumbMC(img,partlbl,partPrice,partManufacture,partSKU,partDescription,partStatus);
					tipMC.x = 260;
					tipMC.y = -290;
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
			var setObj:Object = new Object();
			var idsArr:Array  = new Array();
			for (var i:Number=0; i < setElementArr.length; i++) {
				if (setElementArr[i]!='') {
					var obj:Object = new Object();
					obj.PID     = setElementArr[i];
					obj.APPLIED = setElementArr[i];
					obj.PLBL    = setElementArr[i];
					obj.PRICE1  = setElementArr[i];
					obj.PRICE2  = setElementArr[i];
					idsArr.push(obj);
					addPart(setElementArr[i]);
				}
			}
			setObj[primaryIndex] = idsArr;
			MovieClip(parent.parent.parent.parent.parent).setOfPartsArr.push(setObj);
			getSetInfo();
			//MovieClip(partMC.getChildByName("part20")).visible = false;
			
			//trace(typeof(dRoot));
		}
		
		public function addPart($part_id):void{
			partCls = new Parts($part_id);
			partCls.name = String('p'+$part_id);
			EffectedParts.shopContainer.addChild(partCls);
			partCls.x = xPosCoordinate;
			partCls.y = yPosCoordinate;
			partCls.applyPart($part_id);
			
			/*
			var btn:MovieClip = MovieClip(this.getChildByName("part20"));
			btn.DisplayOutline();
			btn.mouseEnabled  = false;
			btn.mouseChildren  = false;
			*/
		}
		
		public static function removePart($part_id):void{
			EffectedParts.shopContainer.removeChild(EffectedParts.shopContainer.getChildByName('p'+$part_id ));
		}
		
		public function addWheel($wheel_id):void{
			wheelCls = new Wheels($wheel_id);
			wheelCls.name = String('w'+$wheel_id);
			EffectedParts.shopContainer.addChild(wheelCls);
			wheelCls.x = xPosCoordinate;
			wheelCls.y = yPosCoordinate;
			wheelCls.applyWheels($wheel_id);
		}
		
		public static function removeWheel($wheel_id):void{
			EffectedParts.shopContainer.removeChild(EffectedParts.shopContainer.getChildByName('w'+$wheel_id ));
		}
		
		



		/*
		************************************************************************************************************
		Remoting
		*/
		public function getPartsSet($part_id:Number ) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_parts_set,onFault);
			_service.call("AddOnCars.getPartsSet", responder , $part_id  );
		}
		public function get_parts_set(rs:Object) {
			buildPartsSet(rs.serverInfo.initialData[0][1]);
		}


		public function insertInDeal( part_type:String ,part_id:Number, deal_id:Number=1):void {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_insert_deal,onFault);
			_service.call("AddOnCars.insertPartInDeal", responder , deal_id , part_type ,part_id );
		}
		public function get_insert_deal(rs:Object) {
			AID=Number(rs);
			this.dispatchEvent(new ListCompleteEvent());
		}


		public function loadDealPartsInfo(deal_id:Number, type:String ):void {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_deal_part_info,onFault);
			_service.call("AddOnCars.getDealPartsInfo", responder , deal_id , type );
		}
		public function get_deal_part_info(rs:Object) {
			/*
			partCls = new Parts(rs.serverInfo.initialData[0][3]);
			partCls.name=String('p'+rs.serverInfo.initialData[0][3]);
			ContainerList._listContainer.addChildAt(partCls,0);
			partCls.x=-19;
			partCls.y=-17;
			partCls.applyPart(rs.serverInfo.initialData[0][3]);
			Cart.addProduct( rs.serverInfo.initialData[0][3] , rs.serverInfo.initialData[0][4] , rs.serverInfo.initialData[0][5] , 'part' , rs.serverInfo.initialData[0][0]);
			*/
		}

		public function loadDealWheelsInfo(deal_id:Number, type:String ):void {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_deal_wheel_info,onFault);
			_service.call("AddOnCars.getDealWheelInfo", responder , deal_id , type);
		}
		public function get_deal_wheel_info(rs:Object) {
			/*
			wheelCls = new Wheels(rs.serverInfo.initialData[0][3]);
			wheelCls.name=String('w'+ rs.serverInfo.initialData[0][3]);
			ContainerList.addChild(wheelCls);
			wheelCls.x=-19;
			wheelCls.y=-17;
			wheelCls.applyWheels(rs.serverInfo.initialData[0][3]);
			Cart.addProduct( rs.serverInfo.initialData[0][3] , rs.serverInfo.initialData[0][4] , rs.serverInfo.initialData[0][5] , 'wheel' , rs.serverInfo.initialData[0][0]);
			*/

		}


		public function onFault(f:Event ) {
			trace("There was a problem");
		}

		/*  
		***********************************************************************************************************
		Draw Movieclips
		*/

		public function setTotalPrice(txt:Number):void {
			var totalPrice:TextField = new TextField();
			totalPrice.selectable=false;
			totalPrice.text="Price: $"+String(txt);
			totalPrice.height=20;
			totalPrice.x=5;
			totalPrice.y=115;
			partMC.addChild(totalPrice);
			totalPrice.setTextFormat(PartTextFormat.monthlyPriceStyle());
		}


		public function setLabelText(txt:String):void {
			var lblTxt:TextField = new TextField();
			lblTxt.selectable=false;
			lblTxt.text=txt;
			lblTxt.x=5;
			lblTxt.y=85;
			lblTxt.width=160;
			lblTxt.height=20;
			partMC.addChild(lblTxt);
			lblTxt.setTextFormat(PartTextFormat.setPartLabelStyle());
		}

		public function setPriceText(totalPrice:Number = 0 , monthlyPrice:Number = 0 ):void {
			var priceTxt:TextField = new TextField();
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
			imgMC = new MovieClip();
			loadImage(url);
		}

		function loadImage(url:String):void {
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT, imageLoaded );
			loader.load(new URLRequest(url));
		}

		function imageLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			imgMC.addChild(thumbContent);
			imgMC.x=1;
			imgMC.y=1;
			partMC.addChild(imgMC);
			loader.unload();
			resizeMe(imgMC , 170 , 87 , false);
		}

		function resizeMe(mc:MovieClip, maxW:Number, maxH:Number=0, constrainProportions:Boolean=true):void {
			maxH=maxH==0?maxW:maxH;
			mc.width=maxW;
			mc.height=maxH;
			if (constrainProportions) {
				mc.scaleX<mc.scaleY?mc.scaleY=mc.scaleX:mc.scaleX=mc.scaleY;
			}
		}


		/* Debug Mode */
		public function getSetInfo():void{
			//trace(MovieClip(parent.parent.parent.parent.parent).setOfPartsArr.length);
		}
		
		public function debug($mc:MovieClip):void {
			trace("-----------------------------------------------------------------------------------------------------");
			for (var i:uint = 0; i < $mc.numChildren; i++) {
				trace(i+'.\t name:' + $mc.getChildAt(i).name + '\t type:' + typeof ($mc.getChildAt(i))+ '\t' + $mc.getChildAt(i));
			}
		}

	}//$class
}//$package