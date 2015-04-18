package com.main{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	import com.parts.*;
	

	public class WorkSpace extends MovieClip {

		public var partCls:Parts;
		public var wheelCls:Wheels;
		
		public var xPosCoordinate:Number = 50;
		public var yPosCoordinate:Number = 50;
		
		public var assetCls:Assets;
		
		public var canvesImageArr:Array;
		public var littleImageArr:Array;
		public var backgroundImgStr:String;
		public var viewsCoordinateStr:String;
		
		//  Constructors
		public function WorkSpace() {

			canvesImageArr = new Array();
			littleImageArr = new Array();
			
			assetCls = new Assets();
			addChild(assetCls);
			addEventListener(Event.ADDED, assetObjectAdded);
		}
		
		public function assetObjectAdded(e:Event):void {
			if(Main.dealWork == "create"){
				presentationCreateHandlers( Main.trimID , Main.exteriorColorID , Main.interiorColorID );
			}else{
				presentationViewHandlers(Main.dealRef , Main.userID);
			}
			removeEventListener(Event.ADDED, assetObjectAdded);
		}
		
		
		public function onFault(f:Event ) {
			trace("There was a problem");
		}
		
		/*
		*************************************************************************************************
		CREATE
		*/
		public function presentationCreateHandlers( $trim_id:Number , $exterior_id:Number , $interior_id:Number ):void{
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_create_handlers,onFault);
			_service.call("AddOnCars.getFilteredVehicles", responder  , $trim_id , $exterior_id , $interior_id);
		}
		public function get_create_handlers(rs:Object) {

			Main.vehicleID    = rs.serverInfo.initialData[0][0];

			canvesImageArr[0] = rs.serverInfo.initialData[0][4];
			canvesImageArr[1] = rs.serverInfo.initialData[0][5];
			canvesImageArr[2] = rs.serverInfo.initialData[0][6];
			
			littleImageArr[0] = rs.serverInfo.initialData[0][7];
			littleImageArr[1] = rs.serverInfo.initialData[0][8];
			littleImageArr[2] = rs.serverInfo.initialData[0][9];
			
			loadCreateBackground(rs.serverInfo.initialData[0][0]);
		}
		function loadCreateBackground(vehicle_id:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_create_background,onFault);
			_service.call("AddOnCars.getCanvesBackground", responder , vehicle_id);
		}
		function get_create_background(rs:Object) {
			backgroundImgStr   = rs.serverInfo.initialData[0][6];
			viewsCoordinateStr = rs.serverInfo.initialData[0][3]; 
			assetCls.asset_config_loaders();
			MovieClip(parent).buildList();
		}

		
		
		/*
		*************************************************************************************************
		VIEW
		*/
		public function presentationViewHandlers( $deal_ref:String , $uid:Number ):void{
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_view_handlers,onFault);
			_service.call("AddOnCars.getDealVehicle", responder , $deal_ref , $uid);
		}
		public function get_view_handlers(rs:Object) {
			
			Main.vehicleID = rs.serverInfo.initialData[0][0];
			Main.trimID          = rs.serverInfo.initialData[0][1];
			Main.exteriorColorID = rs.serverInfo.initialData[0][12];
			Main.interiorColorID = rs.serverInfo.initialData[0][11];
			
			canvesImageArr[0]= rs.serverInfo.initialData[0][4];
			canvesImageArr[1] = rs.serverInfo.initialData[0][5];
			canvesImageArr[2] = rs.serverInfo.initialData[0][6];
			
			littleImageArr[0] = rs.serverInfo.initialData[0][7];
			littleImageArr[1] = rs.serverInfo.initialData[0][8];
			littleImageArr[2] = rs.serverInfo.initialData[0][9];
			
			loadViewBackground(rs.serverInfo.initialData[0][0]);
				
		}

		function loadViewBackground(vehicle_id:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_view_background,onFault);
			_service.call("AddOnCars.getCanvesBackground", responder , vehicle_id);
		}
		function get_view_background(rs:Object) {
			
			backgroundImgStr   = rs.serverInfo.initialData[0][6];
			viewsCoordinateStr = rs.serverInfo.initialData[0][3]; 
			assetCls.asset_config_loaders();
			MovieClip(parent).buildList();
			
			// start loading parts
			loadDealProducts(Main.dealRef , Main.userID);
		}
		
		
		/*
		**************************************************************************************
		Loading Deal
		*/
		public function loadDealProducts( $deal_ref:String , $uid:Number ):void{
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_deal_products ,onFault);
			_service.call("AddOnCars.getDealProducts", responder , $deal_ref , $uid);
		}
		public function get_deal_products(rs:Object) {
			var count:Number=rs.serverInfo.totalCount;
			for(var i:Number = 0; i < count; i++) {
				if(rs.serverInfo.initialData[i][2] == 'w'){
					MovieClip(parent).listCls.wheelID  = rs.serverInfo.initialData[i][3];
					MovieClip(parent).listCls.wheelAid = rs.serverInfo.initialData[i][0];
					loadDealWheels(rs.serverInfo.initialData[i][3]);		
				}else{
					if(rs.serverInfo.initialData[i][4] == 'Y'){
						//load set
						MovieClip(parent).listCls.setID  = rs.serverInfo.initialData[i][3];
						MovieClip(parent).listCls.setAid = rs.serverInfo.initialData[i][0];
						loadSetPart(rs.serverInfo.initialData[i][3]);
					}else{
						// load simple parts
						MovieClip(parent).listCls.PartsArr.push(rs.serverInfo.initialData[i][3]);
						MovieClip(parent).listCls.pAidArr.push(rs.serverInfo.initialData[i][0]);
						loadParts(rs.serverInfo.initialData[i][3]);
					}
				}
			}
		}
		
		
		// #Parts Sets
		public function loadSetPart($part_id:Number):void{
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_set_part ,onFault);
			_service.call("AddOnCars.getDealParts", responder , $part_id);
		}
		public function get_set_part(rs:Object) {
			var count:Number=rs.serverInfo.totalCount;
			for(var i:Number = 0; i < count; i++) {  // just added in cart
				MovieClip(parent).listCls.cartCls.addProduct( rs.serverInfo.initialData[i][0] , rs.serverInfo.initialData[i][1] , rs.serverInfo.initialData[i][3],rs.serverInfo.initialData[i][4] , 'set' , 'Y' , rs.serverInfo.initialData[i][2] , MovieClip(parent).listCls.setAid );
			}
			loadSetsItems(MovieClip(parent).listCls.setID);  // just add effecte parts on the canves
		}
		
		public function loadSetsItems($part_id:Number):void{
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_deal_sets ,onFault);
			_service.call("AddOnCars.getPartsSet", responder , $part_id);
		}
		public function get_deal_sets(rs:Object) {
			var strIds:String = rs.serverInfo.initialData[0][1];
			MovieClip(parent).listCls.setSTR = strIds;
			var setIdsArr:Array = strIds.split(',');
			for(var i:Number = 0; i < setIdsArr.length; i++){
				if(setIdsArr[i] != ''){
					MovieClip(parent).listCls.setOfPartsArr.push(setIdsArr[i]);
					loadSetParts(setIdsArr[i]);
				}
			}
		}
		public function loadSetParts($part_id:Number):void{
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_set_parts ,onFault);
			_service.call("AddOnCars.getDealParts", responder , $part_id);
		}
		public function get_set_parts(rs:Object) {
			var count:Number = rs.serverInfo.totalCount;
			for(var i:Number = 0; i < count; i++) {
				addPart(rs.serverInfo.initialData[i][0]);
			}
		}
		
		
		
		// # Single Part
		public function loadParts($part_id:Number):void{
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_parts ,onFault);
			_service.call("AddOnCars.getDealParts", responder , $part_id);
		}
		public function get_parts(rs:Object) {
			var count:Number = rs.serverInfo.totalCount;
			for(var i:Number = 0; i < count; i++) {
				//addProduct($partID:Number , $lblStr:String , $price:Number ,$price2:Number, $from:String , $isset:String , $applied:Number , $AID:Number )
				MovieClip(parent).listCls.cartCls.addProduct(rs.serverInfo.initialData[i][0],rs.serverInfo.initialData[i][1], rs.serverInfo.initialData[i][3], rs.serverInfo.initialData[i][4],'part',  rs.serverInfo.initialData[i][5] , rs.serverInfo.initialData[i][2], MovieClip(parent).listCls.pAidArr[i] );
				addPart(rs.serverInfo.initialData[i][0]);
			}
		}
		
		// #Wheels
		public function loadDealWheels( $wheel_id:Number ):void{
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_deal_wheels ,onFault);
			_service.call("AddOnCars.getDealWheels", responder , $wheel_id );
		}
		public function get_deal_wheels(rs:Object) {
			var count:Number=rs.serverInfo.totalCount;
			for(var i:Number = 0; i < count; i++) {
				//addProduct($partID:Number , $lblStr:String , $price:Number ,$price2:Number, $from:String , $isset:String , $applied:Number , $AID:Number )
				MovieClip(parent).listCls.cartCls.addProduct(rs.serverInfo.initialData[i][0],rs.serverInfo.initialData[i][1], rs.serverInfo.initialData[i][3],rs.serverInfo.initialData[i][4],'wheel','N', rs.serverInfo.initialData[i][2],MovieClip(parent).listCls.wheelAid );
				addWheel(rs.serverInfo.initialData[i][0]);
			}
		}
		
		
		
		/*
		**************************************************************************************************
		Part Applyers
		*/
		
		public function addWheel($wheel_id):void {
			wheelCls = new Wheels($wheel_id);
			wheelCls.name = String('w'+$wheel_id);
			EffectedParts.shopContainer.addChild(wheelCls);
			wheelCls.x = xPosCoordinate;
			wheelCls.y = yPosCoordinate;
			wheelCls.applyWheels($wheel_id);
		}
		
		
		public function addPart($part_id):void {
			partCls=new Parts($part_id);
			partCls.name=String('p'+$part_id);
			EffectedParts.shopContainer.addChild(partCls);
			partCls.x = xPosCoordinate;
			partCls.y = yPosCoordinate;
			partCls.applyPart($part_id);
		}
		
		public function addSetPart($part_id):void {
			partCls = new Parts($part_id);
			partCls.name = String('p'+$part_id);
			EffectedParts.shopContainer.addChild(partCls);
			partCls.x = xPosCoordinate;
			partCls.y = yPosCoordinate;
			partCls.applyPart($part_id);
		}


	}//$class
}//$package