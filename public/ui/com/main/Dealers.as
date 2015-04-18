package com.main{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.*;
	import flash.text.*;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	import gs.TweenLite;
	

	public class Dealers extends MovieClip {

		public var logoLoader:Loader;
		public var logoContainer:MovieClip;
		public var name_txt:TextField;
		public var address_txt:TextField;
		public var mix_address_txt:TextField;
		public var phone_txt:TextField;
		
		
		public function Dealers(){
			//loadDealerSettings(Main.dealerID);
			
			name_txt = new TextField();
			addChild(name_txt);
			name_txt.x = 910;
			name_txt.y = 13;
			name_txt.autoSize = TextFieldAutoSize.LEFT;
			name_txt.antiAliasType = AntiAliasType.ADVANCED;
			name_txt.selectable = false;
			
			
			address_txt = new TextField();
			addChild(address_txt);
			address_txt.x = 910;
			address_txt.y = 31;
			address_txt.autoSize = TextFieldAutoSize.LEFT;
			address_txt.antiAliasType = AntiAliasType.ADVANCED;
			address_txt.selectable = false;
			
			mix_address_txt = new TextField();
			addChild(mix_address_txt);
			mix_address_txt.x = 910;
			mix_address_txt.y = 43;
			mix_address_txt.autoSize = TextFieldAutoSize.LEFT;
			mix_address_txt.antiAliasType = AntiAliasType.ADVANCED;
			mix_address_txt.selectable = false;
			
			phone_txt = new TextField();
			addChild(phone_txt);
			phone_txt.x = 910;
			phone_txt.y = 55;
			phone_txt.autoSize = TextFieldAutoSize.LEFT;
			phone_txt.antiAliasType = AntiAliasType.ADVANCED;
			phone_txt.selectable = false;
		}
		
		function loadDealerSettings($uid:Number) {
			var _service = new NetConnection();
			_service.connect(Main.gateWay);
			var responder=new Responder(get_configurations,onFault);
			_service.call("AddOnCars.pullDealsSettings", responder , $uid );
		}
		function get_configurations(rs:Object) {
			loadDealersLogo(Main.hostDomain + Main.dealerLogoFile + rs.serverInfo.initialData[0][6]);
			name_txt.text        = rs.serverInfo.initialData[0][0];
			address_txt.text     = rs.serverInfo.initialData[0][1];
			mix_address_txt.text = rs.serverInfo.initialData[0][2] + ' , '+ rs.serverInfo.initialData[0][3] + ' , ' + rs.serverInfo.initialData[0][4];
			phone_txt.text       = "SALES: "+rs.serverInfo.initialData[0][5];
			
			name_txt.setTextFormat(MainTextFormat.setDealerName());
			address_txt.setTextFormat(MainTextFormat.setDealerAddress());
			mix_address_txt.setTextFormat(MainTextFormat.setDealerAddress());
			phone_txt.setTextFormat(MainTextFormat.setDealerPhone());
			
		}
		public function onFault(f:Event ) {
			trace("There was a problem");
		}



		public function loadDealersLogo(url:String) {
			logoLoader = new Loader();
			logoLoader.load(new URLRequest(url));
			logoLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, dealerLogoLoaded);
		}
		
		public function dealerLogoLoaded(e:Event):void {
			logoContainer = new MovieClip();
			addChild(logoContainer);
			
			logoContainer.addChild(e.currentTarget.content);
			
			
			logoContainer.x=830;
			logoContainer.y=18;
			TweenLite.from(logoContainer, 1, {alpha:0 });
		}



	}//$class
}//$package