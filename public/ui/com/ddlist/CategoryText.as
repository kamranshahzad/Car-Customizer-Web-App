package com.ddlist{

	import flash.display.Sprite;
	import flash.text.*;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	
	public class CategoryText extends Sprite {
		
		function CategoryText():void {}
		
		public function createCategoryText( _txt:String ):TextField {
			var txtField:TextField = new TextField();
			//txtField.htmlText = _txt;
			txtField.text = _txt;
			txtField.x = 0;
			txtField.y = 0;
			txtField.autoSize = TextFieldAutoSize.LEFT;
			txtField.antiAliasType = AntiAliasType.ADVANCED;
			txtField.selectable = false;
			txtField.width = 160;
			//txtField.wordWrap = true;
			
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0xFFFFFF;
			txtFormat.font = "Arial";
			txtFormat.size = 13;
			//txtFormat.bold = true;
			//txtFormat.blockIndent = 0;
			txtFormat.align = "left";
			//txtFormat.letterSpacing = 1;
			txtField.setTextFormat(txtFormat);
			return txtField;
		}
		
		public static function infoTextFormat():TextFormat {
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0xA40000;
			txtFormat.font = "Arial";
			txtFormat.size = 13;
			txtFormat.bold = true;
			txtFormat.align = "left";
			return txtFormat;
		}
		
		
		
	} // $class
}