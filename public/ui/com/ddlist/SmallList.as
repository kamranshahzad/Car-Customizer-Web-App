package com.ddlist{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	import flash.display.SimpleButton;
	import flash.text.*;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	
	import com.main.*;
	import com.partslist.*;
	import flash.net.NetConnection;
	import flash.net.Responder;

	public class SmallList extends MovieClip {
		
		public var partListCls:PartList;
		public var txtObj:CategoryText;
		var posY:Number = 90;
		
		/*
			Constuctors
		*/
		public function SmallList(_listLabels:Array , _listAction:Array) {
			txtObj = new CategoryText();
			for(var i:Number = 0; i < _listLabels.length; i++ ){
				var temp:SimpleButton = listMenus(_listLabels[i],_listAction[i]);
				addChild(temp);
			}
		}
		
		
		
		/*
		**********************************************************************************************************
		Remoting
		*/
		
		public function onFault(f:Event ) {
			trace("There was a problem");
		}
		
		public function loadWheels(wid:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_wheels_db,onFault);
			_service.call("AddOnCars.getWheelByCategoryId", responder , wid , Main.vehicleID );
		}
		public function get_wheels_db(rs:Object) {
			var count:Number=rs.serverInfo.totalCount;

			var partIdArr:Array = new Array();
			var iconsArr:Array = new Array();
			var priceArr:Array = new Array();
			var monthlyPriceArr:Array = new Array();
			var desArr:Array = new Array();
			var lblArr:Array = new Array();
			var manufactureArr:Array = new Array();
			var SKUArr:Array = new Array();
			var statusArr:Array = new Array();
			var effectedArr:Array = new Array();
			
			if (! partListCls) {
				for (var i:Number = 0; i < count; i++) {
					iconsArr.push(rs.serverInfo.initialData[i][9]);
					partIdArr.push(rs.serverInfo.initialData[i][0]);
					priceArr.push(rs.serverInfo.initialData[i][10]);
					monthlyPriceArr.push(rs.serverInfo.initialData[i][11]);
					desArr.push(rs.serverInfo.initialData[i][6]);
					lblArr.push(rs.serverInfo.initialData[i][4]);
					manufactureArr.push(rs.serverInfo.initialData[i][5]);
					SKUArr.push(rs.serverInfo.initialData[i][7]);
					statusArr.push(rs.serverInfo.initialData[i][8]);
					effectedArr.push(rs.serverInfo.initialData[i][3]);
				}
				partListCls = new PartList(partIdArr,iconsArr,priceArr,monthlyPriceArr,desArr,lblArr,manufactureArr,SKUArr,statusArr,effectedArr , 'wheel');
				addChild(partListCls);
			}
		}
		
		
		
		public function removeWheelsList():void {
			if (partListCls) {
				removeChild(partListCls);
				partListCls=null;
			}
		}
		
		
		/*
		********************************************************************************************************************
		Draw Menus Bar
		*/
		
		
		private var txt:String;
		private var gType:String;
		private var gColors:Array;
		private var gAlphas:Array;
		private var gRatio:Array;
		private var gMatrix:Matrix = new Matrix();
		private var gSpread:String;
		public var padding:Number = 5;
		public var rad:Number=10;
		public var normalColor:Array= [ 0x232323 , 0x333232 ];
		public var overColor:Array = [ 0x5e5e5e , 0x6a6a6a ];
		
		public function listMenus(_listTxt:String , _listAction:String):SimpleButton {
			this.txt = _listTxt;
			var btn:CategoryButton = new CategoryButton();
			btn.name = _listAction;
			btn.lbl = _listTxt;
			btn.upState = listUp();
			btn.overState = listOver();
			btn.downState = btn.upState;
			btn.hitTestState = btn.upState;
			btn.addEventListener( MouseEvent.CLICK, myClickReaction);
			
			btn.x = 25;
			btn.y = posY;
			posY = posY + 22;
			return btn;
		}

		function myClickReaction (e:MouseEvent):void{
			removeWheelsList();
			ContainerList.setInfoText(e.target.lbl);
			loadWheels(Number(e.target.name));
		}

		private function listUp():Sprite {
			var btnLabel:TextField = txtObj.createCategoryText(this.txt);
			var btnUp:Sprite = listOverWall(btnLabel);
			btnLabel.x = 5;
			btnLabel.y = (btnUp.height - btnLabel.height) / 2;
			btnUp.addChild(btnLabel);
			return btnUp;
		}

		private function listOver():Sprite {
			var btnLabel:TextField = txtObj.createCategoryText(this.txt);
			var btnDown:Sprite = listNormalWall(btnLabel);
			btnLabel.x = 5;
			btnLabel.y = (btnDown.height - btnLabel.height) / 2;
			btnDown.addChild(btnLabel);
			return btnDown;
		}

		private function listOverWall(btnLabel:TextField):Sprite {
			var _graphics:Sprite = new Sprite();
			gType=GradientType.LINEAR;
			gColors= overColor;
			gAlphas=[1,1];
			gRatio=[0,255];
			gMatrix.createGradientBox( 170 , 20 , 55, 0, 0 );
			gSpread=SpreadMethod.PAD;
			_graphics.graphics.beginGradientFill( gType, gColors, gAlphas, gRatio, gMatrix, gSpread );
			_graphics.graphics.drawRoundRect(0, 0,  150 , 18 , rad, rad);
			_graphics.graphics.endFill();

			return _graphics;
		}
		
		private function listNormalWall(btnLabel:TextField):Sprite {
			var _graphics:Sprite = new Sprite();
			gType=GradientType.LINEAR;
			gColors = normalColor;
			gAlphas=[1,1];
			gRatio=[0,255];
			gMatrix.createGradientBox( 170 , 20 , 55, 0, 0 );
			gSpread = SpreadMethod.PAD;
			_graphics.graphics.beginGradientFill( gType, gColors, gAlphas, gRatio, gMatrix, gSpread );
			_graphics.graphics.drawRoundRect(0, 0, 150 , 18, rad, rad);
			_graphics.graphics.endFill();

			return _graphics;
		}
		


	}// $class
}