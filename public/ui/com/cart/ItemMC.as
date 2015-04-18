package com.cart{

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
	import com.ddlist.*;
	import com.partslist.*;
	import com.parts.*;

	public class ItemMC extends MovieClip {

		public var imgMC:delMC;
		public var cart:Cart;


		public var itemMC:MovieClip;

		public var item_lbl_txt:TextField;
		public var item_price_txt:TextField;

		public var loader:Loader;
		public var iconSrc:String='icon.png';
		public var ids:Number;
		public var lbl:String='';
		public var price:Number;

		public var txtFormat:CartTextFormat;

		public function ItemMC($partID:Number , $lbl:String , $price:Number ,$price2:Number, $from:String ,$isSet:String , $applied:Number , $AID:Number=0):void {
			itemMC = new MovieClip();
			itemMC.graphics.beginFill(0xe5e5e5);
			itemMC.graphics.drawRect(0,0,300,24);
			itemMC.graphics.endFill();
			addChild(itemMC);
			
			imgMC = new delMC();
			imgMC.PART_ID	= $partID;
			imgMC.ISSET		= $isSet;
			imgMC.APPLIED	= $applied;
			imgMC.AID		= $AID;
			imgMC.price     = $price;
			imgMC.monthPrice= $price2;
			imgMC.FROM		= $from;
			imgMC.buttonMode= true;
			if ($from=='wheel') {
				imgMC.name=String('ww'+$partID);
			} else {
				imgMC.name=String('pp'+$partID);
			}
			imgMC.addEventListener(MouseEvent.CLICK , delButtonClick );
			loadIcon(Main.delIconPath + iconSrc);

			this.lbl=$lbl;
			this.price=$price;
			txtFormat = new CartTextFormat();

			setLabelText(lbl);
			setPriceText(price);
		}


		



		/*  SET TEXT  */

		public function setLabelText(txt:String):void {
			item_lbl_txt=new TextField  ;
			item_lbl_txt.text=txt;
			item_lbl_txt.height=20;
			item_lbl_txt.width=150;
			item_lbl_txt.x=2;
			item_lbl_txt.y=3;
			item_lbl_txt.setTextFormat(txtFormat.cartText());
			itemMC.addChild(item_lbl_txt);
		}

		public function setPriceText(txt:Number):void {
			item_price_txt=new TextField  ;
			item_price_txt.text='$'+txt;
			item_price_txt.height=20;
			item_price_txt.width=150;
			item_price_txt.x=200;
			item_price_txt.y=3;
			item_price_txt.setTextFormat(txtFormat.cartText());
			itemMC.addChild(item_price_txt);
		}




		public function delButtonClick(event:MouseEvent) {
			
			
			//trace("AID==>"+event.currentTarget.AID);
			
			if (event.currentTarget.FROM == 'wheel' ) {
				if (event.currentTarget.APPLIED) {
					MovieClip(parent.parent.parent.parent.parent).removeWheel(event.currentTarget.PART_ID );
					MovieClip(parent.parent.parent.parent).removeProductItem(event.currentTarget.name);
				} else {
					MovieClip(parent.parent.parent.parent).removeProductItem(event.currentTarget.name);
				}
				
				//total prices
				TotalMC.totalPrice -= event.currentTarget.price*1; 
				TotalMC.updatePrice();
				
				if(Main.dealType == 'payment'){
					TotalMC.monthlyPrice -= event.currentTarget.monthPrice*1; 
					TotalMC.updateMonthlyPrice();
				}
				
			} else {
				if (event.currentTarget.ISSET == 'Y') {
					MovieClip(parent.parent.parent.parent).breakApartSet(event.currentTarget.PART_ID);
				} else {
					if (event.currentTarget.APPLIED) {
						MovieClip(parent.parent.parent.parent.parent).removePart( event.currentTarget.PART_ID );
						MovieClip(parent.parent.parent.parent).removeProductItem(event.currentTarget.name );
					} else {
						MovieClip(parent.parent.parent.parent).removeProductItem(event.currentTarget.name );
					}
					
					//total prices
					TotalMC.totalPrice -= event.currentTarget.price*1; 
					TotalMC.updatePrice();
					
					if(Main.dealType == 'payment'){
						TotalMC.monthlyPrice -= event.currentTarget.monthPrice*1; 
						TotalMC.updateMonthlyPrice();
					}
				}
			}
			
			Cart.cartArr.pop();
		}




		/*
		******************************************************************************************************************
		Helper Functions
		*/

		public static function removeItemFromCart(item_name:String):void {
			Cart.cartMC.removeChild(Cart.cartMC.getChildByName(item_name));
			Cart.reAllocation();
		}


		/*
		******************************************************************************************************************
		load delete icons
		*/
		function loadIcon(url:String):void {
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT, iconLoaded);
			loader.load(new URLRequest(url));
		}
		function iconLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			loader.unload();
			imgMC.addChild(thumbContent);
			imgMC.x=275;
			imgMC.y=3;
			itemMC.addChild(imgMC);
		}

		/*
		******************************************************************************************************************
		debug
		*/


		public static function debug($mc:Object):void {
			trace("-----------------------------------------------------------------------------------------------------");
			for (var i:uint = 0; i < $mc.numChildren; i++) {
				trace(i+'.\t name:' + $mc.getChildAt(i).name + '\t type:' + typeof ($mc.getChildAt(i))+ '\t' + $mc.getChildAt(i));
			}
		}




	}//$class
}//$package



/*
for (var i:Number = 0; i < Cart.cartMC.numChildren; i++) {
//if (ContainerList._listContainer.getChildAt(i) is MovieClip) {
trace("==>"+i+ ":  "+Cart.cartMC.getChildAt(i).name);
//}
}
*/