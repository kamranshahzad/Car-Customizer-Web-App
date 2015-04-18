package com.main{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.*;
	import flash.display.Loader;
	import flash.net.URLRequest;

	import com.main.templates.*;
	import com.adobe.serialization.json.JSON;
	
	import gs.TweenLite;
	import com.msgwin.*;

	public class Assets extends MovieClip {
		
		public var highLightCls:HighLight;
		public var partCls:EffectedParts;
		public var viewCls:ViewHandlers;
		public var tabCls:Tabs;	
		
		public var bgImgMC:MovieClip;
		public var frontMC:MovieClip;
		public var rearMC:MovieClip;
		public var interiorMC:MovieClip;

		public var canvesMC_front:MovieClip;
		public var canvesMC_rear:MovieClip;
		public var canvesMC_interior:MovieClip;

		public var bgLoader:Loader;
		public var canvesFrontLoader:Loader;
		public var canvesRearLoader:Loader;
		public var canvesInteriortLoader:Loader;
		public var smallViewLoader:Loader;


		/* _backgrounds coordinate  */
		var BG_X:Number=255;
		var BG_Y:Number=100;
		
		var sfviewx_coord:Number = 0;
		var sfviewy_coord:Number = 0;
		
		var srviewx_coord:Number = 0;
		var srviewy_coord:Number = 0;

		var siviewx_coord:Number = 0;
		var siviewy_coord:Number = 0;

		var cfviewx_coord:Number = 0;
		var cfviewy_coord:Number = 0;

		var crviewx_coord:Number = 0;
		var crviewy_coord:Number = 0;

		var civiewx_coord:Number = 0;
		var civiewy_coord:Number = 0;
			


		/*
		********************************************************
		Constructors
		*/
		public function Assets() {
			init();
		}

		function init() {
			bgImgMC = new MovieClip();
			bgImgMC.name="bgImgMC";
			addChild(bgImgMC);

			frontMC = new SmallViewMC();
			frontMC.name="littleFrontMC";
			addChild(frontMC);

			rearMC = new SmallViewMC();
			rearMC.name="littleRearMC";
			addChild(rearMC);

			interiorMC = new SmallViewMC();
			interiorMC.name="littleInteriorMC";
			addChild(interiorMC);

			///
			canvesMC_front = new CanvesViewMC();
			addChild(canvesMC_front);
			canvesMC_front.name="canvesMC_front";

			canvesMC_rear = new CanvesViewMC();
			addChild(canvesMC_rear);
			canvesMC_rear.name="canvesMC_rear";

			canvesMC_interior = new CanvesViewMC();
			addChild(canvesMC_interior);
			canvesMC_interior.name="canvesMC_interior";


			highLightCls = new HighLight();
			addChild(highLightCls);
			highLightCls.y = -30;
			
		}
		
		
		/*
		***********************************************************************
		Remoting
		*/
		
		public function asset_config_loaders():void {
			
			var parentArr:Array = new Array();
			parentArr = JSON.decode(MovieClip(parent).viewsCoordinateStr);

			sfviewx_coord = parentArr[0].SFVIEWX;
			sfviewy_coord = parentArr[0].SFVIEWY;

			srviewx_coord = parentArr[0].SRVIEWX;
			srviewy_coord = parentArr[0].SRVIEWY;

			siviewx_coord = parentArr[0].SIVIEWX;
			siviewy_coord = parentArr[0].SIVIEWY;


			cfviewx_coord = parentArr[0].CFVIEWX;
			cfviewy_coord = parentArr[0].CFVIEWY;

			crviewx_coord = parentArr[0].CRVIEWX;
			crviewy_coord = parentArr[0].CRVIEWY;

			civiewx_coord = parentArr[0].CIVIEWX;
			civiewy_coord = parentArr[0].CIVIEWY;
			
			loadBG( Main.backgroundFiles + MovieClip(parent).backgroundImgStr );
			
			
			loadLittleFrontView( Main.smallViewsFiles + MovieClip(parent).littleImageArr[0]);
			loadLittleRearView( Main.smallViewsFiles + MovieClip(parent).littleImageArr[1]);
			loadLittleInteriorView(Main.smallViewsFiles + MovieClip(parent).littleImageArr[2]);
			
			loadFrontCanves( Main.canvesViewsFiles + MovieClip(parent).canvesImageArr[0] );
			loadRearCanves( Main.canvesViewsFiles + MovieClip(parent).canvesImageArr[1] );
			loadInteriorCanves( Main.canvesViewsFiles + MovieClip(parent).canvesImageArr[2] );
			
			tabCls = new Tabs();
			addChild(tabCls);
			
			
			partCls = new EffectedParts();
			addChild(partCls);
			partCls.x = 30;
			partCls.y = 450;  //450
			
			viewCls = new ViewHandlers();
			addChild(viewCls);
			viewCls.x = 30;
			viewCls.y = 140;
		}
	
		/*
		************************************************************************
		CANVES BACKGROUND
		*/


		function loadBG(url:String) {
			bgLoader = new Loader();
			bgLoader.load(new URLRequest(url));
			bgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, bgImageLoaded);
		}
		function bgImageLoaded(e:Event):void {

			bgImgMC.addChild(e.target.content);
			bgImgMC.x=BG_X;
			bgImgMC.y=BG_Y;
			TweenLite.from(bgImgMC, 1, {alpha:0 });
		}



		/*
		***********************************************************************
		LITTLE VIEWS
		*/

		//# FRONT
		function loadLittleFrontView(url:String) {
			smallViewLoader = new Loader();
			smallViewLoader.load(new URLRequest(url));
			smallViewLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, littleFrontViewLoaded);
		}
		function littleFrontViewLoaded(e:Event):void {
			frontMC.addChild(e.target.content);
			frontMC.x = sfviewx_coord;
			frontMC.y = sfviewy_coord;
			TweenLite.from(frontMC, 1, {alpha:0 });
		}
		//# REAR
		function loadLittleRearView(url:String) {
			smallViewLoader = new Loader();
			smallViewLoader.load(new URLRequest(url));
			smallViewLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, littleRearViewLoaded);
		}
		function littleRearViewLoaded(e:Event):void {
			rearMC.addChild(e.target.content);
			rearMC.x = srviewx_coord;
			rearMC.y = srviewy_coord;
			TweenLite.from(rearMC, 1, {alpha:0 });
		}

		//# Interior
		function loadLittleInteriorView(url:String) {
			smallViewLoader = new Loader();
			smallViewLoader.load(new URLRequest(url));
			smallViewLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, littleInteriorViewLoaded);
		}
		function littleInteriorViewLoaded(e:Event):void {
			interiorMC.addChild(e.target.content);
			interiorMC.x = siviewx_coord;
			interiorMC.y = siviewy_coord;
			TweenLite.from(interiorMC, 1, {alpha:0 });
		}




		/*
		**************************************************************************
		CANVES VIEW
		*/

		//#1
		function loadFrontCanves(url:String) {
			canvesFrontLoader = new Loader();
			canvesFrontLoader.load(new URLRequest(url));
			canvesFrontLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, frontCanvesLoaded);
		}
		function frontCanvesLoaded(e:Event):void {
			canvesMC_front.addChild(e.target.content);
			canvesMC_front.x = cfviewx_coord;  //(PREVIEW_CANVES_W - canvesMC_front.width) + PREVIEW_CANVES_X;
			canvesMC_front.y = cfviewy_coord;  //(PREVIEW_CANVES_H - canvesMC_front.height) + PREVIEW_CANVES_Y;
			TweenLite.from(canvesMC_front, 1, {alpha:0 });


			canvesFrontLoader.unload();
		}

		//#2
		function loadRearCanves(url:String) {
			canvesRearLoader = new Loader();
			canvesRearLoader.load(new URLRequest(url));
			canvesRearLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, rearCanvesLoaded);
		}
		function rearCanvesLoaded(e:Event):void {
			canvesMC_rear.addChild(e.target.content);
			canvesMC_rear.x = crviewx_coord;  //(PREVIEW_CANVES_W - canvesMC_rear.width) + PREVIEW_CANVES_X;
			canvesMC_rear.y = crviewy_coord;  //(PREVIEW_CANVES_H - canvesMC_rear.height) + PREVIEW_CANVES_Y;

			TweenLite.from(canvesMC_rear, 1, {alpha:0 });

			canvesMC_rear.visible=false;
			canvesRearLoader.unload();
		}

		//#3
		function loadInteriorCanves(url:String) {
			canvesInteriortLoader = new Loader();
			canvesInteriortLoader.load(new URLRequest(url));
			canvesInteriortLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, interiorCanvesLoaded);
		}
		function interiorCanvesLoaded(e:Event):void {
			canvesMC_interior.addChild(e.target.content);
			canvesMC_interior.x =  civiewx_coord; // (PREVIEW_CANVES_W - canvesMC_interior.width) + PREVIEW_CANVES_X;
			canvesMC_interior.y =  civiewy_coord; //(PREVIEW_CANVES_H - canvesMC_interior.height) + PREVIEW_CANVES_Y;
			TweenLite.from(canvesMC_interior, 1, {alpha:0 });

			canvesMC_interior.visible=false;
			canvesInteriortLoader.unload();
		}



	}//$class
}//$package