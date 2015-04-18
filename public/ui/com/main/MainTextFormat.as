package com.main{

	import flash.display.Sprite;
	import flash.text.*;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	
	public class MainTextFormat extends Sprite {

		function MainTextFormat():void {}
		
		/*
		*******************************************************************************************
		Dealers
		*/
		public static function setDealerName():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x000000;
			txtFormat.font = "Arial";
			txtFormat.size = 17;
			txtFormat.bold = true;
			txtFormat.blockIndent = 0;
			txtFormat.align = "left";
			//txtFormat.letterSpacing = 1;
			return txtFormat;
		}
		
		public static function setDealerAddress():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x5a4c35;
			txtFormat.font = "Arial";
			txtFormat.size = 11;
			txtFormat.bold = true;
			txtFormat.blockIndent = 0;
			txtFormat.align = "left";
			//txtFormat.letterSpacing = 1;
			return txtFormat;
		}
		public static function setDealerPhone():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x313131;
			txtFormat.font = "Arial";
			txtFormat.size = 11;
			txtFormat.bold = true;
			txtFormat.blockIndent = 0;
			txtFormat.align = "left";
			//txtFormat.letterSpacing = 1;
			return txtFormat;
		}
		
		
		/*
		*******************************************************************************************
		Breadcrumb
		*/
		public static function breadCrambModel():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x9e0000;
			txtFormat.font = "Arial";
			txtFormat.size = 18;
			txtFormat.bold = true;
			txtFormat.blockIndent = 0;
			txtFormat.align = "left";
			//txtFormat.letterSpacing = 1;
			return txtFormat;
		}
		
		public static function breadCrambYear():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x010101;
			txtFormat.font = "Arial";
			txtFormat.size = 14;
			txtFormat.bold = true;
			txtFormat.blockIndent = 0;
			txtFormat.align = "left";
			//txtFormat.letterSpacing = 1;
			return txtFormat;
		}
		
		
		public static function setBreadCrumbFormat():TextFormat{
			var msg_format:TextFormat = new TextFormat();
			msg_format.bold = true;
			//msg_format.size = "20px";
			return msg_format;
		}
		
		
		
	} // $class
}