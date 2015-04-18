package com.cart{

	import flash.display.Sprite;
	import flash.text.*;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	
	public class CartTextFormat extends Sprite {

		function CartTextFormat():void {}

		public function cartText():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x000000;
			txtFormat.font = "Arial";
			txtFormat.size = 12;
			txtFormat.align="left";
			return txtFormat;
		}
		
		public static function totalText():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x000000;
			txtFormat.font = "Arial";
			txtFormat.size = 12;
			txtFormat.bold = true;
			txtFormat.align="left";
			return txtFormat;
		}
	
	} // $class
}