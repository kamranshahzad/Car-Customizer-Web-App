package com.cart{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	
	import com.main.*;
	
	public class TotalMC extends MovieClip{
		
		public static var totalTxt:TextField;
		public static var montlyTxt:TextField;
		
		public static var totalPrice:Number = 0;
		public static var monthlyPrice:Number = 0;
		public var addInputTxt:TextField;
		
		public function TotalMC():void{
			
			totalTxt = new TextField();
			totalTxt.width  = 200;
			totalTxt.height = 20;
			totalTxt.x      = 200;
			addChild(totalTxt);
			
			montlyTxt = new TextField();
			montlyTxt.width  = 200;
			montlyTxt.height = 20;
			montlyTxt.y      = 60;
			montlyTxt.x      = 200;
			addChild(montlyTxt);
			
			
			if(Main.dealType == 'cash'){
				setStaticText();
			}else{
				setStaticText();
				addAdditionalField();
				montlyLbl();
			}
		}
		
		/* Additional payments  */
		public function $Sign():void{
			var staticTxt:TextField = new TextField();
			staticTxt.width = 10;
			staticTxt.height = 20;
			staticTxt.x = 200;
			staticTxt.y = 30;
			staticTxt.text = "$";
			addChild(staticTxt);
			staticTxt.setTextFormat(CartTextFormat.totalText());
		}
		public function doubleZero():void{
			var staticTxt:TextField = new TextField();
			staticTxt.width = 25;
			staticTxt.height = 20;
			staticTxt.x = 290;
			staticTxt.y = 30;
			staticTxt.text = ".00";
			addChild(staticTxt);
			staticTxt.setTextFormat(CartTextFormat.totalText());
		}
	 	public function addAdditionalLbl():void{
			var staticTxt:TextField = new TextField();
			staticTxt.width = 110;
			staticTxt.height = 20;
			staticTxt.y = 30;
			staticTxt.text = "Additional Down";
			addChild(staticTxt);
			staticTxt.setTextFormat(CartTextFormat.totalText());
		}
		public function addAdditionalField():void{
			addAdditionalLbl();
			$Sign();
			doubleZero();
			addInputTxt = new TextField();
			addInputTxt.type = TextFieldType.INPUT;
			addInputTxt.border = true;
			addInputTxt.y = 30;
			addInputTxt.x = 209;
			addInputTxt.width = 80;
			addInputTxt.height = 20;
			addChild(addInputTxt);
		}
		
		
		/* Monthly payments  */
		public function montlyLbl():void{
			var staticTxt:TextField = new TextField();
			staticTxt.width = 110;
			staticTxt.height = 20;
			staticTxt.y = 60;
			staticTxt.text = "Monthly Payment";
			addChild(staticTxt);
			staticTxt.setTextFormat(CartTextFormat.totalText());
		}
		
		public static function updateMonthlyPrice():void{
			montlyTxt.text = '$'+ round(monthlyPrice, 3);
			montlyTxt.setTextFormat(CartTextFormat.totalText());
		}
		
		
		
		
		/*  Total Block*/
		public function setStaticText():void{
			var staticTxt:TextField = new TextField();
			staticTxt.width  = 110;
			staticTxt.height = 20;
			staticTxt.text = "Total Parts Added";
			addChild(staticTxt);
			staticTxt.setTextFormat(CartTextFormat.totalText());	
		}
		
		
		public static function updatePrice():void{
			totalTxt.text = '$'+ round(totalPrice, 3);
			totalTxt.setTextFormat(CartTextFormat.totalText());
		}
		
		public static function round(num:Number, precision:int):Number{
			var decimalPlaces:Number = Math.pow(10, precision);
			return Math.round(decimalPlaces * num) / decimalPlaces;
		}
		
		
		
	} //$class
} //$package