package com.partslist{

	import flash.display.Sprite;
	import flash.text.*;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	
	public class PartTextFormat extends Sprite {

		function PartTextFormat():void {}
				
		public static function setPartLabelStyle():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x000000;
			txtFormat.font = "Arial";
			txtFormat.size= 11;
			//txtFormat.bold = true;
			txtFormat.blockIndent = 0;
			txtFormat.align="left";
			return txtFormat;
		}
		public static function setPartPriceStyle():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0xf12b2b;
			txtFormat.font = "Arial";
			txtFormat.size = 15;
			txtFormat.bold=true;
			txtFormat.align="left";
			return txtFormat;
		}
		public static function monthlyPriceStyle():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x626262;
			txtFormat.font = "Arial";
			//txtFormat.italic = true;
			txtFormat.size = 11;
			//txtFormat.bold=true;
			txtFormat.align = "left";
			return txtFormat;
		}
		
		
		/*
			**********************************
			Tooltip styles
		*/
		public static function setWinTitleBar():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x535252;
			txtFormat.font = "Arial";
			txtFormat.size = 15;
			txtFormat.bold=true;
			txtFormat.align="left";
			return txtFormat;
		}
		
		public static function setPriceText():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0xb00100;
			txtFormat.font = "Arial";
			txtFormat.size = 18;
			txtFormat.bold=true;
			txtFormat.align="left";
			return txtFormat;
		}
		
		public static function setLabelText():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x535252;
			txtFormat.font = "Arial";
			txtFormat.size = 12;
			txtFormat.bold=true;
			txtFormat.align="left";
			return txtFormat;
		}
		
		public static function setTooltipText():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x535252;
			txtFormat.font = "Arial";
			txtFormat.size = 12;
			//txtFormat.bold=true;
			txtFormat.align="left";
			return txtFormat;
		}
		
		
	} // $class
}