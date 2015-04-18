package com.msgwin{

	import flash.display.Sprite;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	import flash.display.SimpleButton;
	import flash.text.*;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;


	public class WinButtons extends MovieClip {

		private var txt:String;
		private var gType:String;
		private var gColors:Array;
		private var gAlphas:Array;
		private var gRatio:Array;
		private var gMatrix:Matrix = new Matrix();
		private var gSpread:String;
		public var padding:Number=10;
		public var rad:Number=10;
		public var color:Array=[0x9C0100,0xC20000];
		
		public var wrapper:MovieClip;
		
		
		public function WinButtons($lbltxt:String):void{
			wrapper = new MovieClip();
			addChild(wrapper);
			
			
			wrapper.addChild(WIN_BUTTON($lbltxt , "_action", 190));
			wrapper.addChild(WIN_BUTTON( " CANCEL " , "_reset", 250));
		}
		
		
		public function WIN_BUTTON($lbltxt:String , $action:String , xPos:Number):SimpleButton {
			var btn:SimpleButton = new SimpleButton();
			btn.name = $action;
			btn.upState=GuiButtonUp($lbltxt);
			btn.overState=GuiButtonOver($lbltxt);
			btn.downState=btn.upState;
			btn.hitTestState=btn.upState;
			btn.x=xPos;
			btn.y=105;
			btn.addEventListener(MouseEvent.CLICK, WinActionHandlers);
			return btn;
		}
		
		function WinActionHandlers(event:MouseEvent):void {
			if(event.currentTarget.name == "_action"){
				MsgWin.winResponse = true;
			}else{
				MsgWin.winResponse = false;
			}
			this.dispatchEvent(new WinCompleteEvent());
		}

		
		
		
		/*
			**************************************************************************************************
			Button Effects
		*/
		private function GuiButtonUp($lbl:String):Sprite {
			var btnLabel:TextField=GuiButtonText( $lbl );
			var btnUp:Sprite=GuiButtonGraphics(btnLabel);
			btnLabel.x = (btnUp.width - btnLabel.width) / 2;
			btnLabel.y = (btnUp.height - btnLabel.height) / 2;
			btnUp.addChild(btnLabel);
			return btnUp;
		}
		private function GuiButtonOver($lbl:String):Sprite {
			color=[color[1],color[0]];
			var btnLabel:TextField=GuiButtonText($lbl);
			var btnDown:Sprite=GuiButtonGraphics(btnLabel);
			btnLabel.x = (btnDown.width - btnLabel.width) / 2;
			btnLabel.y = (btnDown.height - btnLabel.height) / 2;
			btnDown.addChild(btnLabel);
			return btnDown;
		}
		private function GuiButtonText( _txt:String ):TextField {
			var txtField:TextField = new TextField();
			txtField.htmlText= _txt;
			txtField.x=0;
			txtField.y=0;
			txtField.autoSize=TextFieldAutoSize.LEFT;
			txtField.antiAliasType=AntiAliasType.ADVANCED;
			txtField.selectable=false;
			txtField.setTextFormat( MsgWinTextFormat.msgWinButtonTxt() );
			return txtField;
		}
		private function GuiButtonGraphics(btnLabel:TextField):Sprite {
			var _graphics:Sprite = new Sprite();
			gType=GradientType.LINEAR;
			gColors=color;
			gAlphas=[1,1];
			gRatio=[0,255];
			gMatrix.createGradientBox(btnLabel.width+padding, btnLabel.height+padding, 55, 0, 0);
			gSpread=SpreadMethod.PAD;

			_graphics.graphics.beginGradientFill(gType, gColors, gAlphas, gRatio, gMatrix, gSpread);
			_graphics.graphics.drawRoundRect(0, 0, btnLabel.width+padding, btnLabel.height+padding, rad, rad);
			_graphics.graphics.endFill();

			return _graphics;
		}
		
		
	}  // $class
} // $package