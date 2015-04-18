package com.ddlist{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.text.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	import com.main.*;
	import com.cart.*;
	import com.parts.*;
	import com.partslist.*;
	
	
	
	public class ContainerList extends MovieClip {
	
		public var simpleListCls:SimpleList;
		public var wheelSizeListCls:WheelSizeList;
		public var cartCls:Cart;
		public static var infoTxt:TextField;
		public static var currentVIEW:String = '';
		private var _data:Array = new Array();
		
		
		// informar variables
		public var setID:Number = 0;
		public var setAid:Number = 0;
		public var setSTR:String = '';
		
		public var partCls:Parts;
		public var wheelCls:Wheels;
		
		public var xPosCoordinate:Number=50;
		public var yPosCoordinate:Number=50;
		
		
		public var AID:Number=0;
		// process data
		public var setOfPartsArr:Array;
		public var sAidSetArr:Array;
		public var PartsArr:Array;
		public var pAidArr:Array;
		public var wheelID:Number  = 0;
		public var wheelAid:Number = 0;

		
		
		public function ContainerList() {
			
			createListInfoText();
			createCart();
			
			createSimpleList(1);
			
			
			setOfPartsArr = new Array();
			sAidSetArr    = new Array();
			PartsArr      = new Array();
			pAidArr       = new Array();
			
			
			this.addEventListener("partCompleteEvent", partCompleteHandler);
			this.addEventListener("wheelCompleteEvent", wheelCompleteHandler);
			this.addEventListener("setCompleteEvent", setCompleteHandler);
			this.addEventListener("removeCompleteEvent", removeCompleteHandler);
		}
		
		public function createCart():void{
			cartCls = new Cart();
			addChild(cartCls);
			cartCls.x = 738;
			cartCls.y = -400;
		}
		

		//# SimpleList
		public function createSimpleList(part_type_id:Number):void {
			if (! simpleListCls) {
				simpleListCls = new SimpleList(part_type_id );
				addChild(simpleListCls);
			}
		}
		public function removeSimpleList():void {
			if (simpleListCls) {
				removeChild(simpleListCls);
				simpleListCls=null;
			}
		}

		//# WheelSizeList
		public function createWheelSizeList():void {
			if (! wheelSizeListCls) {
				wheelSizeListCls=new WheelSizeList();
				addChild(wheelSizeListCls);
			}
		}
		public function removeWheelSizeList():void {
			if (wheelSizeListCls) {
				removeChild(wheelSizeListCls);
				wheelSizeListCls=null;
			}
		}

		
		//# Info Text
		private function createListInfoText():void {
			infoTxt = new TextField();
			infoTxt.selectable = false;
			infoTxt.height = 20;
			infoTxt.width=400;
			infoTxt.x=200;
			infoTxt.y=45;
			addChild(infoTxt);
		}

		public static function setInfoText(txt:String):void {
			infoTxt.text="";
			infoTxt.text=txt;
			infoTxt.setTextFormat(CategoryText.infoTextFormat());
		}
		
		
		
		/*
		********************************************************************************************
		Worker Functions ( Create )
		*/
		public function buildPartsSet($setVals:String):void {
			var setElementArr:Array = $setVals.split(',');
			for (var i:Number=0; i< setElementArr.length; i++) {
				if (setElementArr[i] != '') {
					var $pid:Number = setElementArr[i];
					if(PartsArr.indexOf($pid) == -1){
						addSetPart($pid);
					}else{
						removeFrmDeal( pAidArr[PartsArr.indexOf($pid)] , 'p' );
						cartCls.removeProductItem('pp'+ PartsArr[PartsArr.indexOf($pid)]);
						PartsArr.splice(PartsArr.indexOf($pid),1);
						pAidArr.splice(PartsArr.indexOf($pid),1);
					}
					setOfPartsArr.push(Number(setElementArr[i]));
				}
			}
			insertSetInDeal('p', setID ,'Y');
		}
		
		public function addSetPart($part_id):void {
			partCls = new Parts($part_id);
			partCls.name = String('p'+$part_id);
			EffectedParts.shopContainer.addChild(partCls);
			partCls.x=xPosCoordinate;
			partCls.y=yPosCoordinate;
			partCls.applyPart($part_id);
		}
		
		public function removeSetPart($part_id , $aid):void {
			EffectedParts.shopContainer.removeChild(EffectedParts.shopContainer.getChildByName('p'+$part_id));
			removeFrmDeal( $aid , 'p' );
		}
		
		
		public function addPart($part_id):void {
			partCls = new Parts($part_id);
			partCls.name = String('p'+$part_id);
			EffectedParts.shopContainer.addChild(partCls);
			partCls.x = xPosCoordinate;
			partCls.y = yPosCoordinate;
			partCls.applyPart($part_id);
			PartsArr.push($part_id);
			insertPartInDeal('p',$part_id);
		}

		public function removePart( $part_id  ):void {
			var $index:Number = PartsArr.indexOf($part_id);
			var $val:Number   = pAidArr[$index]; 
			removeFrmDeal(  $val , 'p' );
			pAidArr.splice( pAidArr.indexOf($val),1 );
			EffectedParts.shopContainer.removeChild(EffectedParts.shopContainer.getChildByName( 'p' + $part_id ));
			PartsArr.splice(PartsArr.indexOf($part_id),1);
		}

		public function addWheel($wheel_id):void {
			wheelCls = new Wheels($wheel_id);
			wheelCls.name=String('w'+$wheel_id);
			EffectedParts.shopContainer.addChild(wheelCls);
			wheelCls.x = xPosCoordinate;
			wheelCls.y = yPosCoordinate;
			wheelCls.applyWheels($wheel_id);
			wheelID = $wheel_id;
			insertWheelInDeal('w', $wheel_id );
		}

		public function removeWheel($wheel_id ):void {
			EffectedParts.shopContainer.removeChild(EffectedParts.shopContainer.getChildByName('w'+$wheel_id));
			removeFrmDeal( wheelAid , 'w' );
			wheelID = 0;
			wheelAid = 0;
		}
		
		
		public function addUneffectedPart($part_id){
			PartsArr.push($part_id);
			insertPartInDeal('p',$part_id);
		}
		
		public function removeUneffectedPart(){
			
		}
		
		
		/*
		************************************************************************************************************
		disptach Events
		*/
		
		public function partCompleteHandler(e:PartCompleteEvent):void {
			//addProduct($partID:Number , $lblStr:String , $price:Number ,$price2:Number , $from:String , $isset:String , $applied:Number , $AID:Number);
			cartCls.addProduct( ContainerMC.PARTID , ContainerMC.PARTLBL ,  ContainerMC.PARTPRICE , ContainerMC.MONTHLYPRICE , ContainerMC.PARTFROM , ContainerMC.ISSET , ContainerMC.APPLIED , AID);
			pAidArr.push(AID);
		}
		public function wheelCompleteHandler(e:WheelCompleteEvent):void {
			cartCls.addProduct( ContainerMC.PARTID , ContainerMC.PARTLBL , ContainerMC.PARTPRICE , ContainerMC.MONTHLYPRICE , ContainerMC.PARTFROM ,ContainerMC.ISSET , ContainerMC.APPLIED , AID );
			wheelAid = AID;
		}

		public function setCompleteHandler(e:SetCompleteEvent):void {
			cartCls.addProduct( ContainerMC.PARTID , ContainerMC.PARTLBL , ContainerMC.PARTPRICE , ContainerMC.MONTHLYPRICE , 'set' , ContainerMC.ISSET , ContainerMC.APPLIED ,AID );
		}
		
		public function removeCompleteHandler(e:RemoveCompleteEvent):void {
			cartCls.addSetParts();
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
		
		
		
		
		public function insertSetItemsInDeal(part_type:String, partIdStr:String ,deal_id:Number=1):void {
			var _service=new NetConnection  ;
			_service.connect(Main.gateWay);
			var responder=new Responder(get_insert_set_items_deal,onFault);
			_service.call("AddOnCars.insertPartItemsInDeal",responder,deal_id,part_type,partIdStr);
		}
		public function get_insert_set_items_deal(rs:Object) {
			var strOutput:String = String(rs);
			var tempArr:Array = strOutput.split(',');
			for(var p:Number = 0; p < tempArr.length; p++){
				if(tempArr[p] != ''){
					sAidSetArr.push(Number(tempArr[p]));
					pAidArr.push(Number(tempArr[p]));
				}
			}
			this.dispatchEvent(new RemoveCompleteEvent);
		}

		public function insertSetInDeal(part_type:String,part_id:Number,ISSET:String ):void {
			var _service=new NetConnection;
			_service.connect(Main.gateWay);
			var responder=new Responder(get_insert_set_deal,onFault);
			_service.call("AddOnCars.insertPartInDeal",responder, Main.dealRef , Main.userID , part_type,part_id,ISSET);
		}
		public function get_insert_set_deal(rs:Object) {
			setAid = Number(rs);
			this.dispatchEvent(new SetCompleteEvent);
		}
		
		
		//  add part in deals
		public function insertPartInDeal(part_type:String,part_id:Number ):void {
			var _service=new NetConnection  ;
			_service.connect(Main.gateWay);
			var responder=new Responder(get_part_insert_result,onFault);
			_service.call("AddOnCars.insertPartInDeal",responder , Main.dealRef , Main.userID ,part_type,part_id);
		}
		public function get_part_insert_result(rs:Object) {
			AID = Number(rs);
			this.dispatchEvent(new PartCompleteEvent);
		}
		
		// add wheel in deals
		public function insertWheelInDeal(part_type:String,part_id:Number,deal_id:Number=1):void {
			var _service=new NetConnection  ;
			_service.connect(Main.gateWay);
			var responder=new Responder(get_wheel_insert_result,onFault);
			_service.call("AddOnCars.insertPartInDeal",responder,Main.dealRef , Main.userID ,part_type , part_id);
		}
		public function get_wheel_insert_result(rs:Object) {
			AID = Number(rs);
			this.dispatchEvent(new WheelCompleteEvent);
		}

		
		/*
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
		*/
		
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
		***************************************************************************************************
		Enable /Disabled Applied Parts Icons
		*/
		
		
		public function updatePartsStates():void{
			trace("_______________________________________________________________");
			if(PartsArr.length > 0){
				for(var i:Number = 0; i < PartsArr.length; i++){
					trace("PartsArr==>"+PartsArr[i]);
				}
			}
			if(pAidArr.length > 0){
				for(var p:Number = 0; p < pAidArr.length; p++){
					trace("pAidArr==>"+pAidArr[p]);
				}
			}
			if(setOfPartsArr.length > 0){
				for(var q:Number = 0; q < setOfPartsArr.length; q++){
					trace("setOfPartsArr==>"+setOfPartsArr[q]);
				}
			}
			if(sAidSetArr.length > 0){
				for(var r:Number = 0; r < sAidSetArr.length; r++){
					trace("sAidSetArr==>"+sAidSetArr[r]);
				}
			}
		}
		
		public function doIt(part_name:String):void {
			
			//trace(  MovieClip(.getChildByName(part_name)) );
			//var btn:MovieClip= MovieClip(MovieClip(parent.).getChildByName(part_name));
			//trace("Here::=>"+btn);
			
			
			/*
			if(btn){
				btn.DisplayOutline();
				btn.mouseEnabled=false;
				btn.mouseChildren=false;
			}*/
		}

		public function undoIt(part_name:String):void {
			var btn:MovieClip=MovieClip(this.getChildByName(part_name));
			if(btn){
				btn.DisplayOutline();
				btn.mouseEnabled=true;
				btn.mouseChildren=true;
			}
		}
		
		
		

	}// $class
}