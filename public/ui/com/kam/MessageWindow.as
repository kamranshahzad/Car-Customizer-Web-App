package com.kam{

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


	public class MessageWindow extends Sprite {

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

		public function MessageWindow() {
		}

		
		
		/*
			_windows Buttons
		*/
		public function windowButton( _t:String , buttonAction:String ):SimpleButton {
			this.txt=_t;
			var btn:SimpleButton = new SimpleButton();
			btn.name = buttonAction;
			btn.upState=GuiButtonUp();
			btn.overState=GuiButtonOver();
			btn.downState=btn.upState;
			btn.hitTestState=btn.upState;
			btn.x = 220;
			btn.y = 105;
			return btn;
		}
		private function GuiButtonUp():Sprite {
			var btnLabel:TextField=GuiButtonText(this.txt);
			var btnUp:Sprite=GuiButtonGraphics(btnLabel);
			btnLabel.x = (btnUp.width - btnLabel.width) / 2;
			btnLabel.y = (btnUp.height - btnLabel.height) / 2;
			btnUp.addChild(btnLabel);
			return btnUp;
		}

		private function GuiButtonOver():Sprite {
			color=[color[1],color[0]];
			var btnLabel:TextField=GuiButtonText(this.txt);
			var btnDown:Sprite=GuiButtonGraphics(btnLabel);
			btnLabel.x = (btnDown.width - btnLabel.width) / 2;
			btnLabel.y = (btnDown.height - btnLabel.height) / 2;
			btnDown.addChild(btnLabel);
			return btnDown;
		}
		private function GuiButtonText( _txt:String ):TextField {
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0xFFFFFF;
			txtFormat.font="Verdana";
			txtFormat.size=12;
			txtFormat.bold=true;
			txtFormat.align="left";

			var txtField:TextField = new TextField();
			txtField.htmlText=_txt;
			txtField.x=0;
			txtField.y=0;
			txtField.autoSize=TextFieldAutoSize.LEFT;
			txtField.antiAliasType=AntiAliasType.ADVANCED;
			txtField.selectable=false;
			txtField.setTextFormat( txtFormat );

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



		/*
				_window layout
		*/
		private function windowTitleText( _txt:String ):TextField {
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0xC30000;
			txtFormat.font="Verdana";
			txtFormat.size=14;
			txtFormat.bold=true;
			txtFormat.align="left";

			var txtField:TextField = new TextField();
			txtField.htmlText=_txt;
			txtField.x=0;
			txtField.y=0;
			txtField.autoSize=TextFieldAutoSize.LEFT;
			txtField.antiAliasType=AntiAliasType.ADVANCED;
			txtField.selectable=false;
			txtField.setTextFormat( txtFormat );

			return txtField;
		}
		private function windowMessageText( _txt:String ):TextField {
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color=0x000000;
			txtFormat.font="Verdana";
			txtFormat.size=12;
			txtFormat.align="center";

			var txtField:TextField = new TextField();
			txtField.htmlText=_txt;
			txtField.x=0;
			txtField.y=0;
			txtField.autoSize=TextFieldAutoSize.LEFT;
			txtField.antiAliasType=AntiAliasType.ADVANCED;
			txtField.selectable=false;
			txtField.setTextFormat( txtFormat );

			return txtField;
		}
		private function drawWindowTop():Sprite {
			var _topBox:Sprite = new Sprite();
			_topBox.graphics.lineStyle(1, 0xC1C1C1);
			_topBox.graphics.beginFill(0xECECEC);
			_topBox.graphics.drawRect(0,0,520,30);
			_topBox.graphics.endFill();

			return _topBox;
		}
		public function drawWindowBox(_titleTxt:String , _msgTxt:String):Sprite {
			var windowContainer:Sprite = new Sprite();
			//windowContainer.transform.matrix = new Matrix(1, 0, 0, 1, 210, 80);
			//windowContainer.setRegistration(100, 60);
			windowContainer.graphics.lineStyle(1, 0xC1C1C1);
			windowContainer.graphics.beginFill(0xFFFFFF);
			windowContainer.graphics.drawRect(0,0,520,160);
			windowContainer.graphics.endFill();
			// set Dimentions

			windowContainer.addChild(drawWindowTop());
			var titleLabel:TextField = windowTitleText(_titleTxt);
			var msgTxt:TextField = windowMessageText(_msgTxt);
			windowContainer.addChild(titleLabel);
			windowContainer.addChild(msgTxt);
			// set position
			windowContainer.x = 140;
			windowContainer.y = 300;
			titleLabel.x = 5;
			titleLabel.y = 5;
			msgTxt.x = 50;
			msgTxt.y = 50;
			return windowContainer;
		}


	



	}
}