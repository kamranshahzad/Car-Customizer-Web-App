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

	public class WheelSizeList extends MovieClip {

		public var txtObj:CategoryText;
		public var partListCls:PartList;
		public var containerObj:ContainerList;
		public var _smallContainer:SmallList;
		
		
		var posX:Number=15;
		public static var infoTxt:TextField;
		
		
		/*
			************************************************************************************************
			Constuctor
		*/
		public function WheelSizeList() {
			
			txtObj = new CategoryText();
			loadWheelSize(2);
			
		}
		
		/*
			***************************************************************************************************
			Remoting
		*/

		function onFault(f:Event ) {
			trace("There was a problem");
		}

		function loadWheelSize(tid:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_wheelSize,onFault);
			_service.call("AddOnCars.getWheelSizeAll", responder , tid  );
		}
		function get_wheelSize(rs:Object) {
			
			var wTypeArr:Array = new Array();
			var wLblArr:Array = new Array();
			var count:Number=rs.serverInfo.totalCount;
			for (var i:Number = 0; i < count; i++) {
				if (rs.serverInfo.initialData[i][1]!='Wheel Accessories') {
					wTypeArr.push(rs.serverInfo.initialData[i][0]);
					wLblArr.push(rs.serverInfo.initialData[i][1]);
					var temp:SimpleButton=listMenus(rs.serverInfo.initialData[i][1],rs.serverInfo.initialData[i][0]);
					addChild(temp);
				} else {
					var temp2:SimpleButton=listWheelAccessory(rs.serverInfo.initialData[i][1],rs.serverInfo.initialData[i][0]);
					addChild(temp2);
				}
			}			
			drawLine();
			removeSmallList();
			loadWheelTypes(Number(wTypeArr[0]));
			ContainerList.setInfoText("Wheel Size: "+wLblArr[0]);
		}

		// # Wheel Types
		

		function loadWheelTypes(tid:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_wheelTypes,onFault);
			_service.call("AddOnCars.getWheelTypesById", responder , tid , Main.vehicleID , Main.userID );
		}
		function get_wheelTypes(rs:Object) {
			var count:Number=rs.serverInfo.totalCount;
			var lblArr:Array = new Array();
			var actArr:Array = new Array();
			if (! _smallContainer) {
				for (var i:Number = 0; i < count; i++) {
					lblArr.push(rs.serverInfo.initialData[i][1]);
					actArr.push(rs.serverInfo.initialData[i][0]);
				}
				_smallContainer=new SmallList(lblArr,actArr);
				addChild(_smallContainer);
			}
		}

		public function removeSmallList():void {
			if (_smallContainer) {
				removeChild(_smallContainer);
				_smallContainer=null;
			}
		}


		
		
		
		/*
		#1
		*/
		public function listMenus(_listTxt:String , _listAction:String ):SimpleButton {
			this.txt=_listTxt;
			var btn:CategoryButton = new CategoryButton();
			btn.name=_listAction;
			btn.lbl=_listTxt;
			btn.upState=listUp();
			btn.overState=listOver();
			btn.downState=btn.upState;
			btn.hitTestState=btn.upState;
			btn.addEventListener( MouseEvent.CLICK, myClickReaction);

			btn.y=67;
			btn.x=posX;
			posX=posX+30;

			return btn;
		}


		function myClickReaction(e:MouseEvent):void {
			removeSmallList();
			ContainerList.setInfoText("Wheel Size: "+e.target.lbl);
			loadWheelTypes(Number(e.target.name));
		}


		private function listUp():Sprite {

			var btnLabel:TextField=txtObj.createCategoryText(this.txt);
			var btnUp:Sprite=listOverWall(btnLabel);
			btnLabel.x=5;
			btnLabel.y = (btnUp.height - btnLabel.height) / 2;
			btnUp.addChild(btnLabel);
			return btnUp;
		}

		private function listOver():Sprite {
			var btnLabel:TextField=txtObj.createCategoryText(this.txt);
			var btnDown:Sprite=listNormalWall(btnLabel);
			btnLabel.x=5;
			btnLabel.y = (btnDown.height - btnLabel.height) / 2;
			btnDown.addChild(btnLabel);
			return btnDown;
		}

		private function listOverWall(btnLabel:TextField):Sprite {
			var _graphics:Sprite = new Sprite();
			gType=GradientType.LINEAR;
			gColors=overColor;
			gAlphas=[1,1];
			gRatio=[0,255];
			gMatrix.createGradientBox( 170 , 20 , 55, 0, 0 );
			gSpread=SpreadMethod.PAD;
			_graphics.graphics.beginGradientFill( gType, gColors, gAlphas, gRatio, gMatrix, gSpread );
			_graphics.graphics.drawRoundRect(0, 0,  25 , 20 , rad, rad);
			_graphics.graphics.endFill();

			return _graphics;
		}

		private function listNormalWall(btnLabel:TextField):Sprite {
			var _graphics:Sprite = new Sprite();
			gType=GradientType.LINEAR;
			gColors=normalColor;
			gAlphas=[1,1];
			gRatio=[0,255];
			gMatrix.createGradientBox( 170 , 20 , 55, 0, 0 );
			gSpread=SpreadMethod.PAD;
			_graphics.graphics.beginGradientFill( gType, gColors, gAlphas, gRatio, gMatrix, gSpread );
			_graphics.graphics.drawRoundRect(0, 0, 25 , 20, rad, rad);
			_graphics.graphics.endFill();

			return _graphics;
		}

		/*
			******************************************************************************************************************
			#2   (LIST  Wheel Accessories )
		*/
		public function listWheelAccessory(_listTxt:String , _listAction:String ):SimpleButton {
			this.txt=_listTxt;
			var btn:SimpleButton = new SimpleButton();
			btn.name=_listAction;
			btn.upState=listUp1();
			btn.overState=listOver1();
			btn.downState=btn.upState;
			btn.hitTestState=btn.upState;
			btn.addEventListener( MouseEvent.CLICK, listWheelClick);

			btn.y=205;
			btn.x=15;

			return btn;
		}


		function listWheelClick(e:MouseEvent):void {
			removeSmallList();
			removeAccessoryList();
			ContainerList.setInfoText("Wheel Accessories");
			loadWheelAccessories(Number(e.target.name));
		}
		
		//Remoting
		public function loadWheelAccessories(cid:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_wheel_accessories,onFault);
			_service.call("AddOnCars.getPartByCategoryId", responder , cid);
		}
		public function get_wheel_accessories(rs:Object) {
			
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
			
			if (! partListCls ) {
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
				partListCls = new PartList(partIdArr,iconsArr,priceArr,monthlyPriceArr,desArr,lblArr,manufactureArr,SKUArr,statusArr,effectedArr , 'part');
				addChild(partListCls);
			}
		}
		
		
		
		public function removeAccessoryList():void {
			if (partListCls) {
				removeChild(partListCls);
				partListCls=null;
			}
		}
		

		
		
		/*
		*************************************************************************************************************
		Draw Menus List
		*/
		
		
		
		// Draw line
		public function drawLine():void {
			var line:Sprite = new Sprite();
			line.graphics.lineStyle(1, 0x494949);
			line.graphics.moveTo(17,195);///This is where we start drawing
			line.graphics.lineTo(184, 195);
			addChild(line);
		}
		
		
		
		private var txt:String;
		private var gType:String;
		private var gColors:Array;
		private var gAlphas:Array;
		private var gRatio:Array;
		private var gMatrix:Matrix = new Matrix();
		private var gSpread:String;
		public var padding:Number=5;
		public var rad:Number=10;
		public var normalColor:Array=[0x232323,0x333232];
		public var overColor:Array=[0x5e5e5e,0x6a6a6a];
		
		
		private function listUp1():Sprite {

			var btnLabel:TextField=txtObj.createCategoryText(this.txt);
			var btnUp:Sprite=listOverWall1(btnLabel);
			btnLabel.x=5;
			btnLabel.y = (btnUp.height - btnLabel.height) / 2;
			btnUp.addChild(btnLabel);
			return btnUp;
		}

		private function listOver1():Sprite {
			var btnLabel:TextField=txtObj.createCategoryText(this.txt);
			var btnDown:Sprite=listNormalWall1(btnLabel);
			btnLabel.x=5;
			btnLabel.y = (btnDown.height - btnLabel.height) / 2;
			btnDown.addChild(btnLabel);
			return btnDown;
		}

		private function listOverWall1(btnLabel:TextField):Sprite {
			var _graphics:Sprite = new Sprite();
			gType=GradientType.LINEAR;
			gColors=overColor;
			gAlphas=[1,1];
			gRatio=[0,255];
			gMatrix.createGradientBox( 170 , 20 , 55, 0, 0 );
			gSpread=SpreadMethod.PAD;
			_graphics.graphics.beginGradientFill( gType, gColors, gAlphas, gRatio, gMatrix, gSpread );
			_graphics.graphics.drawRoundRect(0, 0,  170 , 20 , rad, rad);
			_graphics.graphics.endFill();

			return _graphics;
		}

		private function listNormalWall1(btnLabel:TextField):Sprite {
			var _graphics:Sprite = new Sprite();
			gType=GradientType.LINEAR;
			gColors=normalColor;
			gAlphas=[1,1];
			gRatio=[0,255];
			gMatrix.createGradientBox( 170 , 20 , 55, 0, 0 );
			gSpread=SpreadMethod.PAD;
			_graphics.graphics.beginGradientFill( gType, gColors, gAlphas, gRatio, gMatrix, gSpread );
			_graphics.graphics.drawRoundRect(0, 0, 170 , 20, rad, rad);
			_graphics.graphics.endFill();

			return _graphics;
		}
		
		


	}// $class
}