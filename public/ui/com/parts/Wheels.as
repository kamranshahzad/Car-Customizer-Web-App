package com.parts{

	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import fl.transitions.*;
	import fl.transitions.easing.*;

	import flash.net.NetConnection;
	import flash.net.Responder;
	
	import flash.geom.Matrix;
	
	import com.main.*;
	import com.adobe.serialization.json.JSON;
	import com.preloader.Preloader;

	public class Wheels extends MovieClip {


		private var Container:MovieClip;
		public var preloader:Preloader; 
		public var currentView:String ='';
		
		
		//Front Canves View
		var fViewAsset:String = '';
		var fViewCoordin:String = '';
		var fViewCoordArr:Array;
		public var frontMCArr:Array;    
		private var frontMC:CanvesViewMC;   
		var frontLoader:Loader;
		private var frontPt:Number=0;
		private var fPointer:Number = 0;

		
		//Rear View
		var rViewAsset:String = '';
		var rViewCoordin:String = '';
		var rViewCoordArr:Array;
		public var rearMCArr:Array;		
		private var rearMC:CanvesViewMC;
		var rearLoader:Loader;
		private var rearPt:Number=0;
		private var rPointer:Number = 0;

		
		//Interior View
		var iViewAsset:String = '';
		var iViewCoordin:String = '';
		var iViewCoordArr:Array;
		public var interiorMCArr:Array;
		private var interiorMC:CanvesViewMC;
		var interiorLoader:Loader;
		private var interiorPt:Number=0;
		private var iPointer:Number = 0;

		
		//Other View
		var oViewAsset:String = '';
		var oViewCoordin:String = '';
		var oViewCoordArr:Array;
		public var otherMCArr:Array;
		private var otherMC:CanvesViewMC;
		var otherLoader:Loader;
		private var otherPt:Number=0;
		private var oPointer:Number = 0;

		
		
		
		//FVIEW View  	(front view)
		var fVIEWAsset:String = '';
		var fVIEWCoordin:String = '';
		var fVIEWCoordArr:Array;
		public var FVIEWMCArr:Array;
		private var FVIEWMC:SmallFVIEWMC;
		var FVIEWLoader:Loader;
		public var fVIEWPt:Number=0;
		var fVPointer:Number = 0;

		
		
		//RVIEW View	(rear view)
		var rVIEWAsset:String = '';
		var rVIEWCoordin:String = '';
		var rVIEWCoordArr:Array;
		public var RVIEWMCArr:Array;
		private var RVIEWMC:SmallRVIEWMC;
		var RVIEWLoader:Loader;
		private var rVIEWPt:Number=0;
		private var rVPointer:Number = 0;


		
		//IVIEW View	(interior view)
		var iVIEWAsset:String = '';
		var iVIEWCoordin:String = '';
		var iVIEWCoordArr:Array;
		public var IVIEWMCArr:Array;
		private var IVIEWMC:SmallIVIEWMC;
		var IVIEWLoader:Loader;
		private var iVIEWPt:Number=0;
		private var iVPointer:Number = 0;
		
		
		
		
		public function Wheels($part_id:Number, $currentView:String = 'FVIEW'):void {// Contructor		
			Container = new MovieClip();
			//Container.graphics.lineStyle(1, 0x0060ff);
			//Container.graphics.beginFill(0x20a107);
			//Container.graphics.drawRect(0,0,802,420);
			//Container.graphics.endFill();
			addChild(Container);
			Container.x = -80;//-198
			Container.y = -500;//-488
			
			currentView = $currentView;
			
			frontMCArr = new Array();
			rearMCArr = new Array();
			interiorMCArr = new Array();
			otherMCArr = new Array();
			
			FVIEWMCArr = new Array();
			RVIEWMCArr = new Array();
			IVIEWMCArr = new Array();
			
			pleaseWait('Loading and Applying Selected Part...');
		}
		
		
		public function applyWheels($part_id:Number):void{

			loadPart($part_id);

		}
		
		
		
		/* 
		******************************************************************************
			 Processer Functions 
		*/
		public function onFault(f:Event ) {
			trace("There was a problem");
		}

		public function loadPart(pid:Number):void {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_parts_db,onFault);
			_service.call("AddOnCars.getWheelByID", responder , pid);
		}
		public function get_parts_db(rs:Object) {
			
			/*  Front */
			if(rs.serverInfo.initialData[0][2] != '_blank'){		
				this.fViewAsset = rs.serverInfo.initialData[0][2];
			}
			if(rs.serverInfo.initialData[0][11] != '_blank'){		
				this.fViewCoordin = rs.serverInfo.initialData[0][11];
				fViewCoordArr = new Array();
				fViewCoordArr = decodeString(fViewCoordin);
				for(var f1:Number = 0 ; f1 < fViewCoordArr.length; f1 ++ ){
					startFrontClips();
				}
				loadFrontParts(Main.effectAccessoriesFiles + fViewAsset);
			}
			
			
			/*  Rear */
			if(rs.serverInfo.initialData[0][3] != '_blank'){		
				this.rViewAsset = rs.serverInfo.initialData[0][3];
			}
			if(rs.serverInfo.initialData[0][12] != '_blank'){		
				this.rViewCoordin = rs.serverInfo.initialData[0][12];
				rViewCoordArr = new Array();
				rViewCoordArr = decodeString(rViewCoordin);
				for(var r1:Number = 0 ; r1 < rViewCoordArr.length; r1++ ){
					startRearClips();
				}
				loadRearParts(Main.effectAccessoriesFiles + rViewAsset);
			}
			
			
			/* Interiors */
			if(rs.serverInfo.initialData[0][4] != '_blank'){		
				this.iViewAsset = rs.serverInfo.initialData[0][4];
			}
			if(rs.serverInfo.initialData[0][13] != '_blank'){		
				this.iViewCoordin = rs.serverInfo.initialData[0][13];
				iViewCoordArr = new Array();
				iViewCoordArr = decodeString(iViewCoordin);
				for(var i:Number = 0 ; i < iViewCoordArr.length; i++ ){
					startInteriorClips();
				}
				loadInteriorParts(Main.effectAccessoriesFiles + iViewAsset);
			}
			
			/* Others */
			if(rs.serverInfo.initialData[0][5] != '_blank'){		
				this.oViewAsset = rs.serverInfo.initialData[0][5];
			}
			if(rs.serverInfo.initialData[0][14] != '_blank'){		
				this.oViewCoordin = rs.serverInfo.initialData[0][14];
				oViewCoordArr = new Array();
				oViewCoordArr = decodeString(oViewCoordin);
				for(var o:Number = 0 ; o < oViewCoordArr.length; o++ ){
					startOtherClips();
				}
				loadOtherParts(Main.effectAccessoriesFiles + oViewAsset);
			}
			
			
			
			/* FVIEW */
			if(rs.serverInfo.initialData[0][6] != '_blank'){		
				this.fVIEWAsset = rs.serverInfo.initialData[0][6];
			}
			if(rs.serverInfo.initialData[0][15] != '_blank'){		
				this.fVIEWCoordin = rs.serverInfo.initialData[0][15];
				fVIEWCoordArr = new Array();
				fVIEWCoordArr = decodeString(fVIEWCoordin);
				for(var a:Number = 0 ; a < fVIEWCoordArr.length; a++ ){
					startFVIEWClips();
				}
				loadfViewParts(Main.effectAccessoriesFiles + fVIEWAsset);
			}
			
			/* RVIEW */
			if(rs.serverInfo.initialData[0][7] != '_blank'){		
				this.rVIEWAsset = rs.serverInfo.initialData[0][7];
			}
			if(rs.serverInfo.initialData[0][16] != '_blank'){		
				this.rVIEWCoordin = rs.serverInfo.initialData[0][16];
				rVIEWCoordArr = new Array();
				rVIEWCoordArr = decodeString(rVIEWCoordin);
				for(var b:Number = 0 ; b < rVIEWCoordArr.length; b++ ){
					startRVIEWClips();
				}
				loadrViewParts(Main.effectAccessoriesFiles + rVIEWAsset);
			}
			
			/* IVIEW */
			if(rs.serverInfo.initialData[0][8] != '_blank'){		
				this.rVIEWAsset = rs.serverInfo.initialData[0][8];
			}
			if(rs.serverInfo.initialData[0][17] != '_blank'){		
				this.iVIEWCoordin = rs.serverInfo.initialData[0][17];
				iVIEWCoordArr = new Array();
				iVIEWCoordArr = decodeString(iVIEWCoordin);
				for(var c:Number = 0 ; c < iVIEWCoordArr.length; c++ ){
					startIVIEWClips();
				}
				loadiViewParts(Main.effectAccessoriesFiles + iVIEWAsset);
			}
			
			// Active View
			updateApplication(currentView);
			endWait();
		}
		
		function decodeString(coordStr:String):Array {
			var parentArr:Array = new Array();
			parentArr = JSON.decode(coordStr);
			return parentArr;
		}
		

		/*
			***************************************************************************************
			Worker Functions
		*/
		
		
		// # Front (done)
		function loadFrontParts(url:String):void {
			frontLoader = new Loader();
			frontLoader.load(new URLRequest(url));
			frontLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, frontLoaded);
		}
		public function frontLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			frontMCArr[frontPt].addChild(thumbContent);
			if(frontPt < fViewCoordArr.length - 1){
				loadFrontParts(Main.effectAccessoriesFiles + fViewAsset);
				frontPt++;
			}
		}
		public function startFrontClips() {
			var my_matrix:Matrix = new Matrix( fViewCoordArr[fPointer].dimentions.a, fViewCoordArr[fPointer].dimentions.b, fViewCoordArr[fPointer].dimentions.c, fViewCoordArr[fPointer].dimentions.d, fViewCoordArr[fPointer].dimentions.tx, fViewCoordArr[fPointer].dimentions.ty );
			frontMC = new CanvesViewMC();
			frontMC.name = String(fPointer);
			Container.addChild(frontMC);
			frontMCArr.push(frontMC);
			frontMC.transform.matrix= my_matrix;
			fPointer++;
		}
		
		
		
		// # Rear (Done)
		function loadRearParts(url:String):void {
			rearLoader = new Loader();
			rearLoader.load(new URLRequest(url));
			rearLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, rearLoaded);
		}
		public function rearLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			rearMCArr[rearPt].addChild(thumbContent);
			if(rearPt < rViewCoordArr.length - 1){
				loadRearParts(Main.effectAccessoriesFiles + rViewAsset);
				rearPt++;
			}
		}
		public function startRearClips() {
			var my_matrix:Matrix = new Matrix( rViewCoordArr[rPointer].dimentions.a, rViewCoordArr[rPointer].dimentions.b, rViewCoordArr[rPointer].dimentions.c, rViewCoordArr[rPointer].dimentions.d, rViewCoordArr[rPointer].dimentions.tx, rViewCoordArr[rPointer].dimentions.ty );
			rearMC = new CanvesViewMC();
			rearMC.name = String(rPointer);
			Container.addChild(rearMC);
			rearMCArr.push(rearMC);
			rearMC.transform.matrix = my_matrix;
			rPointer++;
		}
		
		
		
		// # Interiors (Done)
		function loadInteriorParts(url:String):void {
			interiorLoader = new Loader();
			interiorLoader.load(new URLRequest(url));
			interiorLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, interiorLoaded);
		}
		public function interiorLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			interiorMCArr[interiorPt].addChild(thumbContent);
			if(interiorPt < iViewCoordArr.length - 1){
				loadInteriorParts(Main.effectAccessoriesFiles + iViewAsset);
				interiorPt++;
			}
		}
		public function startInteriorClips() {
			var my_matrix:Matrix = new Matrix( iViewCoordArr[iPointer].dimentions.a, iViewCoordArr[iPointer].dimentions.b, iViewCoordArr[iPointer].dimentions.c, iViewCoordArr[iPointer].dimentions.d, iViewCoordArr[iPointer].dimentions.tx, iViewCoordArr[iPointer].dimentions.ty );
			interiorMC = new CanvesViewMC();
			interiorMC.name = String(iPointer);
			Container.addChild(interiorMC);
			interiorMCArr.push(interiorMC);
			interiorMC.transform.matrix = my_matrix;
			iPointer++;
		}
		
		
		// # Other (Done)
		function loadOtherParts(url:String):void {
			otherLoader = new Loader();
			otherLoader.load(new URLRequest(url));
			otherLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, otherLoaded);
		}
		public function otherLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			otherMCArr[otherPt].addChild(thumbContent);
			if(otherPt < oViewCoordArr.length -1 ){
				loadOtherParts(Main.effectAccessoriesFiles + oViewAsset);
				otherPt++;
			}
		}
		public function startOtherClips() {
			var my_matrix:Matrix = new Matrix( oViewCoordArr[oPointer].dimentions.a, oViewCoordArr[oPointer].dimentions.b, oViewCoordArr[oPointer].dimentions.c, oViewCoordArr[oPointer].dimentions.d, oViewCoordArr[oPointer].dimentions.tx, oViewCoordArr[oPointer].dimentions.ty );
			otherMC = new CanvesViewMC();
			otherMC.name = String(oPointer);
			Container.addChild(otherMC);
			otherMCArr.push(otherMC);
			otherMC.transform.matrix = my_matrix;
			oPointer++;
		}
		
		
		/*
			***************************************************************
			Small Views (no hiding..)
		*/
		
		
		// # FVIEW  (Done)
		function loadfViewParts(url:String):void {
			FVIEWLoader = new Loader();
			FVIEWLoader.load(new URLRequest(url));
			FVIEWLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, FVIEWLoaded);
		}
		public function FVIEWLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			FVIEWMCArr[fVIEWPt].addChild(thumbContent);
			if(fVIEWPt < fVIEWCoordArr.length - 1){
				loadfViewParts(Main.effectAccessoriesFiles + fVIEWAsset);
				fVIEWPt++;
			}
		}
		public function startFVIEWClips() {
			var my_matrix:Matrix = new Matrix( fVIEWCoordArr[fVPointer].dimentions.a, fVIEWCoordArr[fVPointer].dimentions.b, fVIEWCoordArr[fVPointer].dimentions.c, fVIEWCoordArr[fVPointer].dimentions.d, fVIEWCoordArr[fVPointer].dimentions.tx, fVIEWCoordArr[fVPointer].dimentions.ty );
			FVIEWMC = new SmallFVIEWMC();
			FVIEWMC.name = String(FVIEWMC);
			Container.addChild(FVIEWMC);
			FVIEWMCArr.push(FVIEWMC);
			FVIEWMC.transform.matrix= my_matrix;
			fVPointer++;
		}
		
		
		
		// # RVIEW  ( Done )
		function loadrViewParts(url:String):void {
			RVIEWLoader = new Loader();
			RVIEWLoader.load(new URLRequest(url));
			RVIEWLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, RVIEWLoaded);
		}
		public function RVIEWLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			RVIEWMCArr[rVIEWPt].addChild(thumbContent);
			if(rVIEWPt < rVIEWCoordArr.length - 1){
				loadrViewParts(Main.effectAccessoriesFiles + rVIEWAsset);
				rVIEWPt++;
			}
		}
		public function startRVIEWClips() {
			
			var my_matrix:Matrix = new Matrix( rVIEWCoordArr[rVPointer].dimentions.a, rVIEWCoordArr[rVPointer].dimentions.b, rVIEWCoordArr[rVPointer].dimentions.c, rVIEWCoordArr[rVPointer].dimentions.d, rVIEWCoordArr[rVPointer].dimentions.tx, rVIEWCoordArr[rVPointer].dimentions.ty );
			RVIEWMC = new SmallRVIEWMC();
			RVIEWMC.name = String(rVPointer);
			Container.addChild(RVIEWMC);
			RVIEWMCArr.push(RVIEWMC);
			RVIEWMC.transform.matrix= my_matrix;
			rVPointer++;
		}
		
		
		
		
		// # IVIEW  (Done)
		function loadiViewParts(url:String):void {
			IVIEWLoader = new Loader();
			IVIEWLoader.load(new URLRequest(url));
			IVIEWLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, IVIEWLoaded);
		}

		public function IVIEWLoaded(event:Event):void {
			var thumbContent:DisplayObject=event.target.content;
			IVIEWMCArr[iVIEWPt].addChild(thumbContent);
			if(iVIEWPt < iVIEWCoordArr.length - 1){
				loadiViewParts(Main.effectAccessoriesFiles + iVIEWAsset);
				iVIEWPt++;
			}
		}

		public function startIVIEWClips() {
			var my_matrix:Matrix = new Matrix( iVIEWCoordArr[iVPointer].dimentions.a, iVIEWCoordArr[iVPointer].dimentions.b, iVIEWCoordArr[iVPointer].dimentions.c, iVIEWCoordArr[iVPointer].dimentions.d, iVIEWCoordArr[iVPointer].dimentions.tx, iVIEWCoordArr[iVPointer].dimentions.ty );
			IVIEWMC = new SmallIVIEWMC();
			IVIEWMC.name = String(iVPointer);
			Container.addChild(IVIEWMC);
			IVIEWMCArr.push(IVIEWMC);
			IVIEWMC.transform.matrix= my_matrix;
			iVPointer++;
		}
		
		/*
		**********************************************************************************
		Helpers
		*/
		
		public function updateApplication( viewControlVar:String ):void {
			//if(isPartApplied){
				switch(viewControlVar){
					case 'FVIEW':
							showParts(frontMCArr);
							hideParts(rearMCArr);
							hideParts(interiorMCArr);
							hideParts(otherMCArr);
							break;
					case 'RVIEW':
							showParts(rearMCArr);
							hideParts(frontMCArr);
							hideParts(interiorMCArr);
							hideParts(otherMCArr);
							break;
					case 'IVIEW':
							showParts(interiorMCArr);
							hideParts(frontMCArr);
							hideParts(rearMCArr);
							hideParts(otherMCArr);
							break;
					case 'OVIEW':
							showParts(otherMCArr);
							hideParts(frontMCArr);
							hideParts(rearMCArr);
							hideParts(interiorMCArr);
							break;
				}
			//}
		}
		
		public function showParts(MCArray:Array):void{
			if(MCArray.length > 0){
				for(var i:Number = 0; i < MCArray.length; i++){
					if(MCArray[i] != undefined){
						MCArray[i].visible = true;
					}
				}
			}
		}
		
		public function hideParts(MCArray:Array):void{
			if(MCArray.length > 0){
				for(var i:Number = 0; i < MCArray.length; i++){
					if(MCArray[i] != undefined){
						MCArray[i].visible = false;
					}
				}
			}
		}
		
		/* Part Pre-loader*/
		public function pleaseWait($msg:String , xPos:Number = 540 , yPos:Number = 400 ):void{
			//trace("called");
			preloader = new Preloader($msg);
			Container.addChild(preloader);
			preloader.x = xPos;
			preloader.y = yPos;
		}
		
		public function endWait():void{
			if(preloader){
				Container.removeChild(preloader);
				preloader = null;
			}
		}


	}//$class
}//$package