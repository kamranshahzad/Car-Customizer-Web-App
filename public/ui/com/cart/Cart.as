package com.cart{
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import fl.containers.ScrollPane;
	import fl.controls.ScrollPolicy;	
	import fl.controls.DataGrid;
	import fl.data.DataProvider;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	
	import com.main.*;
	import com.partslist.*;
	import com.adobe.serialization.json.JSON;
	
	
	public class Cart extends MovieClip{
		
		public static var sp:ScrollPane;
		public static var cartMC:MovieClip;
		public static var itemCls:ItemMC;
		public var totalPriceCls:TotalMC; 
		public var pointer:Number 			= 0;
		public static var posY:Number 		= 0;
		public static var noProducts:Number = 0;
		
		public static var cartArr:Array;
		
	
		// cash , payment
		public function Cart()
		{
			cartMC = new MovieClip();  // listing movieclip
			
			sp = new ScrollPane();
			addChild(sp);
			sp.source = cartMC;
			sp.move(100, 50);
			sp.horizontalScrollPolicy = ScrollPolicy.OFF;
			
			totalPriceCls = new TotalMC();
			addChild(totalPriceCls);

			
			if(Main.dealType == 'cash'){
				sp.setSize(315, 240);
				totalPriceCls.x = 100;
				totalPriceCls.y = 300;
				drawLine(100, 296);
			}else{
				sp.setSize(315, 140);
				totalPriceCls.x = 100;
				totalPriceCls.y = 220;
				drawLine(95, 215);
				drawLine(95, 245);
				drawLine(95, 275);
				drawLine(95, 305);
			}
			
			cartArr = new Array();
		}
		
		public function test():void{
			//trace(MovieClip(parent));
		}
		
				
		public function addProduct($partID:Number , $lblStr:String , $price:Number ,$price2:Number, $from:String , $isset:String , $applied:Number , $AID:Number ):void{
			var prefix:String ='';
			switch($from){
				case 'wheel':
						prefix = 'ww';
						break;
				case 'part':
						prefix = 'pp';
						break;
				case 'set':
						prefix = 'ss';
						break;
			}
			if(Cart.cartMC.getChildByName(prefix + $partID) == null ){
				itemCls = new ItemMC ( $partID , $lblStr , $price, $price2 , $from , $isset ,$applied, $AID );
				itemCls.name = prefix + String($partID);
				cartMC.addChild(itemCls);
				itemCls.y = posY;
				posY = posY + 25;
				sp.refreshPane();
				
				TotalMC.totalPrice += $price*1; 
				TotalMC.updatePrice();
				
				if(Main.dealType == 'payment'){
					TotalMC.monthlyPrice += $price2*1; 
					TotalMC.updateMonthlyPrice();
				}
				
				cartArr.push($partID);
			}
			
			//debug(Cart.cartMC);
		}
		
		public function removeProductItem($product_name:String ):void{
			Cart.cartMC.removeChild(Cart.cartMC.getChildByName($product_name));
			reAllocation();
			//debug(Cart.cartMC);
		}
		
		
		/*
		*******************************************************************************************************************************
		Builders
		*/
		public function breakApartSet( $part_id:Number ):void{
			removeProductItem('ss'+ $part_id);
			var ids:String = '';
			for (var p:Number = 0; p < MovieClip(parent).setOfPartsArr.length; p++) {
				ids += MovieClip(parent).setOfPartsArr[p] + ',';
			}
			MovieClip(parent).setSTR = ids;
			MovieClip(parent).insertSetItemsInDeal('p',ids);
			MovieClip(parent).removeFrmDeal( MovieClip(parent).setAid , 'p' );
			MovieClip(parent).setOfPartsArr.splice(0 , MovieClip(parent).setOfPartsArr.length );
			MovieClip(parent).setID  = 0;
		}
		
		
		/*
		****************************************************************************************************************
		Remoting
		*/
		
		public function addSetParts() {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder = new Responder(add_set_parts_in_deal,onFault);
			_service.call("AddOnCars.getSetPartItems", responder , MovieClip(parent).setSTR );
		}
		function add_set_parts_in_deal(rs:Object) {
			var count:Number=rs.serverInfo.totalCount;
			for (var i:Number = 0; i < count; i++) {
				//addProduct(rs.serverInfo.initialData[i][0],rs.serverInfo.initialData[i][1],rs.serverInfo.initialData[i][2],'part','N',1,MovieClip(parent).pAidArr[i]);
				addProduct(rs.serverInfo.initialData[i][0],rs.serverInfo.initialData[i][1],rs.serverInfo.initialData[i][2],rs.serverInfo.initialData[i][3],'part','N',1,MovieClip(parent).pAidArr[i]);
				MovieClip(parent).PartsArr.push(rs.serverInfo.initialData[i][0]);
			}
			MovieClip(parent).sAidSetArr.splice( 0 , MovieClip(parent).sAidSetArr.length );
			MovieClip(parent).setSTR = '';
		}
		
		public function onFault(f:Event ) {
			trace("There was a problem");
		}

		
		/*
		************************************************************************************************************
		Helper functions
		*/
		public static function reAllocation():void{
			posY = 0;
			for(var i:Number=0; i < cartMC.numChildren; i++){
				cartMC.getChildAt(i).y = posY;
				posY = posY + 25;
			}
			sp.refreshPane();
		}
		
		public function getMessage():void{
			trace("Massage");
		}
		
		
		public static function getCartInformation():String{
			
			/*
			for (var i:uint = 0; i < EffectedParts.shopContainer.numChildren; i++) {
				trace(EffectedParts.shopContainer.getChildAt(i).name);
			}
			*/
			var str:String = 'Testings';
			return str;
		}
		
		public function findInSwapSets( $key , $fieldValue ):Boolean {
			var parentArr:Array=JSON.decode($fieldValue);
			var temp:Boolean=false;
			for (var p:Number = 0; p < parentArr.length; p++) {
				for (var val:* in parentArr[p]) {
					for (var q:Number = 0; q < parentArr[p][val].length; q++) {
						if ( parentArr[p][val][q].ID == $key ) {
							getSwapSetItems(val , $fieldValue);
							temp = true;
						}
					}
				}
			}
			return temp;
		}

		public function getSwapSetItems($setLabel:String , $fieldValue:String ):Array {
			var tempArr:Array = new Array();
			var parentArr:Array=JSON.decode($fieldValue);
			for (var p:Number = 0; p < parentArr.length; p++) {
				for (var val:* in parentArr[p]) {
					if (val==$setLabel) {
						for (var q:Number = 0; q < parentArr[p][val].length; q++) {
							tempArr.push(parentArr[p][val][q].ID);
						}
					}
				}
			}
			return tempArr;
		}
		
		public function drawLine(xA:Number , yA:Number):void {
			var line:Sprite = new Sprite();
			line.graphics.lineStyle(1, 0xb2b2b2);
			line.graphics.moveTo(0,0);///This is where we start drawing
			line.graphics.lineTo(327, 0);
			addChild(line);
			line.x = xA;
			line.y = yA;
		}
		
		
		public static function debug($mc:Object):void {
			trace("-----------------------------------------------------------------------------------------------------");
			for (var i:uint = 0; i < $mc.numChildren; i++) {
				trace(i+'.\t name:' + $mc.getChildAt(i).name + '\t type:' + typeof ($mc.getChildAt(i))+ '\t' + $mc.getChildAt(i));
			}
		}
		
	} //$class
} //$package