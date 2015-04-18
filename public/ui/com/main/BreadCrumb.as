package com.main{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.*;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.*;
	
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	import gs.TweenLite;
	
	

	public class BreadCrumb extends MovieClip {

		
		public var breadObj:breadcrumb;
		public var dealerCls:Dealers;
		public var model_txt:TextField;
		public var year_txt:TextField;
		public var logoLoader:Loader;
		public var logoContainer:MovieClip;
		
		
		/*
		**********************************************************************************
		Constructors
		*/
		
		public function BreadCrumb() {
			breadObj=new breadcrumb();
			addChild(breadObj);
			init();
		}


		public function init() {
			breadObj.x=600;
			breadObj.y=28;

			dealerCls = new Dealers();
			addChild(dealerCls);

			model_txt = new TextField();
			breadObj.addChild(model_txt);
			model_txt.x = -515;
			model_txt.y = -7;
			model_txt.autoSize = TextFieldAutoSize.LEFT;
			model_txt.antiAliasType = AntiAliasType.ADVANCED;
			model_txt.selectable = false;
			
			year_txt = new TextField();
			breadObj.addChild(year_txt);
			year_txt.x = -515;
			year_txt.y = 18;
			year_txt.autoSize = TextFieldAutoSize.LEFT;
			year_txt.antiAliasType = AntiAliasType.ADVANCED;
			year_txt.selectable = false;
			
			
			model_txt.text = Main.ModelName;
			year_txt.text  = Main.YearName + " / "+ Main.InteriorColor;
			
			model_txt.setTextFormat(MainTextFormat.breadCrambModel());
			year_txt.setTextFormat(MainTextFormat.breadCrambYear());
			
			breadObj.startOverBtn.addEventListener(MouseEvent.CLICK, startOverClick);
			
			loadMakesLogo();
		}

		function startOverClick(event:MouseEvent) {
			var req:URLRequest = new URLRequest(Main.startOverLink);
			navigateToURL( req, '_self' );
		}


		/*
		******************************************************************************
		Load makes logo
		*/
		function loadMakesLogo() {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_make_logo,onFault);
			_service.call("AddOnCars.getMakesLogo", responder , Main.makeID );
		}
		function get_make_logo(rs:Object) {
			loadLogo( Main.makeFiles + rs.serverInfo.initialData[0][0]);
		}
		public function onFault(f:Event ) {
			trace("There was a problem");
		}

		public function loadLogo(url:String) {
			logoLoader = new Loader();
			logoLoader.load(new URLRequest(url));
			logoLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, dealerLogoLoaded);
		}
		
		public function dealerLogoLoaded(e:Event):void {
			logoContainer = new MovieClip();
			addChild(logoContainer);
			
			logoContainer.addChild(e.currentTarget.content);
			
			
			logoContainer.x 	= 1120;
			logoContainer.y 	= 12;
			
			logoContainer.width  = 60;
			logoContainer.height = 60;
			
			TweenLite.from(logoContainer, 1, {alpha:0 });
		}


	}//$class
}//$package