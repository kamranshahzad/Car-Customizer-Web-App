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

	public class SimpleList extends MovieClip {


		public var partListCls:PartList;
		public var txtObj:CategoryText;
		public var posY:Number=67;
		public static var infoTxt:TextField;
		
		/*
		***********************************************************************************************
		Constuctors
		*/
		public function SimpleList( part_type_id:Number ) {
			
			txtObj = new CategoryText();
			loadCategories(part_type_id);
			
		}


		/*  
		***************************************************************************************
			Remoting  
		*/

		public function loadCategories(tid:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_parts_categories,onFault);
			_service.call("AddOnCars.getAllPartCategories", responder , tid , Main.vehicleID , Main.userID );
		}

		public function get_parts_categories(rs:Object) {
			var count:Number=rs.serverInfo.totalCount;
			if ( count > 0 ) {
				var lblArr:Array = new Array();
				var actionArr:Array = new Array();
				for (var i:Number = 0; i < count; i++) {
					lblArr.push(rs.serverInfo.initialData[i][1]);
					actionArr.push(rs.serverInfo.initialData[i][0]);
					var temp:SimpleButton=listMenus(rs.serverInfo.initialData[i][1],rs.serverInfo.initialData[i][0]);
					addChild(temp);
				}
				ContainerList.setInfoText(lblArr[0]);
				loadParts(actionArr[0]);
				Main.CURRENT_CATEGORYID = actionArr[0]; 
			} else {
				ContainerList.setInfoText("There is no categories exist");
			}
		}


		// Load Scolling Parts List
		
		public function loadParts(cid:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_parts,onFault);
			_service.call("AddOnCars.getPartByCategoryId", responder , cid , Main.vehicleID );
		}
		public function get_parts(rs:Object) {
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
			var isSETArr:Array = new Array();
			
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
					isSETArr.push(rs.serverInfo.initialData[i][12]);
				}
				partListCls = new PartList(partIdArr,iconsArr,priceArr,monthlyPriceArr,desArr,lblArr,manufactureArr,SKUArr,statusArr,effectedArr,'part',isSETArr);				
				addChild(partListCls);
			}
			
			//set swap set
			isSwapSet(Main.CURRENT_CATEGORYID);
		}
		
		public function removePartsList():void {
			if (partListCls) {
				removeChild(partListCls);
				partListCls=null;
			}
		}
		
		// SWAP SET
		public function isSwapSet($cat_id:Number ) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(is_swap_exist,onFault);
			_service.call("AddOnCars.isSwapSetExist", responder , Main.vehicleID , $cat_id  );
		}

		public function is_swap_exist(rs:Object) {
			if(rs){
				loadSwapSet(Main.CURRENT_CATEGORYID);
			}
		}
		
		public function loadSwapSet($cat_id:Number ) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_swap_set,onFault);
			_service.call("AddOnCars.getSwapSet", responder , $cat_id , Main.vehicleID );
		}

		public function get_swap_set(rs:Object) {
			var count:Number=rs.serverInfo.totalCount;
			Main.SWAP_SET = rs.serverInfo.initialData[0][3]; 
		}
		
		
		
		public function onFault(f:Event ) {
			trace("There was a problem");
		}




		/*
		*******************************************************************************************************
		Menus List Design
		*/
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


		public function listMenus(_listTxt:String , _listAction:String):SimpleButton {
			this.txt=_listTxt;
			var btn:CategoryButton = new CategoryButton();
			btn.name=_listAction;
			btn.lbl=_listTxt;
			btn.upState=listUp();
			btn.overState=listOver();
			btn.downState=btn.upState;
			btn.hitTestState=btn.upState;
			btn.addEventListener( MouseEvent.CLICK, myClickReaction);


			btn.x=10;
			btn.y=posY;
			posY=posY+22;
			return btn;
		}

		public function myClickReaction(e:MouseEvent):void {
			removePartsList();
			ContainerList.setInfoText(e.target.lbl);
			Main.CURRENT_CATEGORYID = Number(e.target.name);
			loadParts(Main.CURRENT_CATEGORYID);
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
			_graphics.graphics.drawRoundRect(0, 0,  170 , 20 , rad, rad);
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
			_graphics.graphics.drawRoundRect(0, 0, 170 , 20, rad, rad);
			_graphics.graphics.endFill();

			return _graphics;
		}


	}// $class
}