package com.msgwin{

	import flash.display.Sprite;
	import flash.text.*;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	
	public class MsgWinTextFormat {

		function MsgWinTextFormat():void {}
				
		public static function msgWindowText():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x000000;
			txtFormat.font="Verdana";
			txtFormat.size=12;
			txtFormat.align="center";
			return txtFormat;
		}
		
		public static function msgWinTitleTxt():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0xC30000;
			txtFormat.font="Verdana";
			txtFormat.size=14;
			txtFormat.bold=true;
			txtFormat.align="left";
			return txtFormat;
		}
		
		public static function msgWinButtonTxt():TextFormat{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0xFFFFFF;
			txtFormat.font="Verdana";
			txtFormat.size=12;
			txtFormat.bold=true;
			txtFormat.align="left";
			return txtFormat;
		}
		
		
		
	} // $class
}