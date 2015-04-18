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


	public class MsgWin extends MovieClip {
		
		public var Container:MovieClip;
		public var buttonMC:WinButtons;
		public var $winW:Number = 500;
		public var $winH:Number = 150;
		
		public static var winResponse:Boolean = false;
		
		
		public function MsgWin( $titleTxt:String,$msgTxt:String ,$actionBtnLbl:String ) {
			Container = new MovieClip();
			Container.graphics.lineStyle(1, 0xC1C1C1);
			Container.graphics.beginFill(0xFFFFFF);
			Container.graphics.drawRect(0,0,$winW ,$winH);
			Container.graphics.endFill();

			Container.addChild(drawTitleBar($winW));
			
			var titleLabel:TextField= windowTitleText($titleTxt);
			var msgTxt:TextField=windowMessageText($msgTxt);
			
			Container.addChild(titleLabel);
			Container.addChild(msgTxt);
			titleLabel.x = titleLabel.y= 5;
			msgTxt.x = 10;
			msgTxt.y = 50;
			
			addChild(Container);
			
			//add buttons
			buttonMC = new WinButtons($actionBtnLbl);
			Container.addChild(buttonMC);
			
			setRegistrationPoint(Container, 250, 60 , false);
		}
		
		
		public function setRegistrationPoint(s:MovieClip, regx:Number, regy:Number, showRegistration:Boolean )
		{
			s.transform.matrix = new Matrix(1, 0, 0, 1, -regx, -regy);
			if (showRegistration)
			{
				var mark:MovieClip = new MovieClip();
				mark.graphics.lineStyle(1, 0x000000);
				mark.graphics.moveTo(-5, -5);
				mark.graphics.lineTo(5, 5);
				mark.graphics.moveTo(-5, 5);
				mark.graphics.lineTo(5, -5);
				s.parent.addChild(mark);
			}
		}
		

		private function drawTitleBar(_winW:Number ):Sprite {
			var _topBox:Sprite = new Sprite();
			_topBox.graphics.lineStyle(1, 0xC1C1C1);
			_topBox.graphics.beginFill(0xd1cfcf);
			_topBox.graphics.drawRect(0,0,_winW,30);
			_topBox.graphics.endFill();

			return _topBox;
		}

		private function windowMessageText( _txt:String ):TextField {
			var txtField:TextField = new TextField();
			txtField.htmlText=_txt;
			txtField.width = 480;
			txtField.height = 40;
			txtField.multiline = true;
			txtField.wordWrap = true;
			txtField.x=0;
			txtField.y=0;
			txtField.selectable=false;
			txtField.setTextFormat( MsgWinTextFormat.msgWindowText() );

			return txtField;
		}
		private function windowTitleText( _txt:String ):TextField {
			var txtField:TextField = new TextField();
			txtField.htmlText=_txt;
			txtField.width = 360;
			txtField.height = 20;
			txtField.x=0;
			txtField.y=0;
			txtField.selectable=false;
			txtField.setTextFormat( MsgWinTextFormat.msgWinTitleTxt() );

			return txtField;
		}

		
	}// $class
}



/*
   USE OF WINDOW
   
   var $msgStr = "Test";

var _obj:MsgWin = new MsgWin("Title of Window ", $msgStr , "  OK  ");
_obj.addEventListener("winCompleteEvent", completed);


addChild(_obj);


function completed(e:WinCompleteEvent):void {
	removeChild(_obj);
	_obj = null;
	//MsgWin.winResponse;
}

*/