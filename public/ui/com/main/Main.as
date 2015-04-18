package com.main{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.*;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.*;
	import flash.display.DisplayObjectContainer;
	import flash.net.navigateToURL
	import flash.text.*;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	
	import flash.display.LoaderInfo;
	import gs.TweenLite;

	import com.kam.*;
	import com.parts.*;
	import com.cart.*;
	import com.ddlist.*;
	import com.partslist.*;
	import com.msgwin.*;
	
	import com.adobe.serialization.json.JSON;
	

	public class Main extends MovieClip {
		
		
		/*
		public static var key:String           			= 'http://www.addoncars.com/aoc/amfphp/gateway.php';
		public static var delIconPath:String            = 'http://www.addoncars.com/aoc/public/assets/';
		public static var swfsPath:String               = 'http://www.addoncars.com/aoc/public/ui/';
		public static var invoicePath:String            = 'http://www.addoncars.com/aoc/public/deal/viewinvoice/id/';
		*/
		
		
		
		public static var key:String           			= 'http://localhost/aoc/amfphp/gateway.php';
		public static var delIconPath:String            = 'http://localhost/aoc/public/assets/';
		public static var swfsPath:String               = 'http://localhost/aoc/public/ui/';
		public static var invoicePath:String            = 'http://localhost/aoc/public/deal/viewinvoice/id/';
		
		
		public static var hostDomain:String             = '';
		public static var gateWay:String                = '';
		public static var effectAccessoriesFiles:String = '';
		public static var accessoriesIconFiles:String   = '';
		public static var smallViewsFiles:String        = '';
		public static var canvesViewsFiles:String       = '';
		public static var backgroundFiles:String        = '';
		public static var uploadScript:String           = '';
		public static var dealerLogoFile:String         = '';
		public static var makeFiles:String              = '';
		public static var startOverLink:String 			= '';
		
		public static var SWAP_SET:String = '';
		public static var CURRENT_CATEGORYID:Number = 0;
		public static var VIEW_CONTROL_VAR:String 	= "FVIEW";// "FVIEW" , "RVIEW" , "IVIEW" ,"OVIEW" 
		
		
		
		public static var dealType:String  			= 'cash';   //cash , payment
		public static var vehicleID:Number 			= 21;
		public static var dealerID:Number 			= 2;
		public static var userID:Number    			= 3;
		public static var dealRef:String   			= '141';
		public static var dealWork:String  			= 'create'; // create , view
		public static var makeID:Number             = 1;
		public static var trimID:Number 			= 9;
		public static var exteriorColorID:Number	=7;
		public static var interiorColorID:Number 	= 4;
		public static var ModelName:String     		= "ACCORD COUPE";
		public static var YearName:String      		= "2010";
		public static var InteriorColor:String 		= "Black Inetrior";
		public static var InvoiceNO:String          = '4CFC70083CCE61291612168';
		
		
		
		/*
		public static var dealType:String  			= '';
		public static var vehicleID:Number 			= 0;
		public static var dealerID:Number 			= 0;
		public static var userID:Number    			= 0;
		public static var dealRef:String   			= '';
		public static var dealWork:String  			= '';
		public static var makeID:Number             = 0;
		public static var trimID:Number 			= 0;
		public static var exteriorColorID:Number	= 0;
		public static var interiorColorID:Number 	= 0;
		public static var ModelName:String     		= '';
		public static var YearName:String      		= '';
		public static var InteriorColor:String 		= '';
		public static var InvoiceNO:String          = '';
		*/
		
		
		public var doneLoader:Loader;
		
		public var bgCls:Background;
		public var workCls:WorkSpace;
		public var breadCls:BreadCrumb;
		public var helpCls:Help;
		public var listCls:ContainerList;
		public var doneMC:MovieClip;
		
		
		public function Main() {
			loadConfigurations();
		}
		
		
		public function getValuesFromHtml():void{
			
			// disable function below
			dealType        = this.loaderInfo.parameters.dealType;// cash , payment
			vehicleID       = this.loaderInfo.parameters.vehicleID;
			dealerID        = this.loaderInfo.parameters.dealerID;
			userID          = this.loaderInfo.parameters.userID;
			dealRef         = this.loaderInfo.parameters.dealRef;
			dealWork        = this.loaderInfo.parameters.dealWork;// create , view
			makeID        	= this.loaderInfo.parameters.makeID;
			trimID          = this.loaderInfo.parameters.trimID;
			exteriorColorID = this.loaderInfo.parameters.exteriorColorID;
			interiorColorID = this.loaderInfo.parameters.interiorColorID;
			ModelName 		= this.loaderInfo.parameters.ModelName;
			YearName 		= this.loaderInfo.parameters.YearName;
			InteriorColor 	= this.loaderInfo.parameters.InteriorColor;
			InvoiceNO 		= this.loaderInfo.parameters.invoiceID;
			
			
			// set links from html page
			startOverLink  = this.loaderInfo.parameters.startOverLink;
			
		}
		

		/* ddlist */
		public function buildList():void {
			listCls = new ContainerList();
			addChild(listCls);
			listCls.x = 20;
			listCls.y = 515;
		}
		
		public function destroyList():void {
			if (listCls) {
				removeChild(listCls);
				listCls=null;
			}
		}



		/* White Background */
		public function buildBackground():void {
			bgCls = new Background();
			addChild(bgCls);
		}
		
		public function destroyBackground():void {
			if (bgCls) {
				removeChild(bgCls);
				bgCls=null;
			}
		}

		/* Workspace */
		public function buildWorkspace():void {
			workCls = new WorkSpace();
			addChild(workCls);
		}
		public function destroyWorkspace():void {
			if (workCls) {
				removeChild(workCls);
				workCls=null;
			}
		}

		/* BreadCrumb */
		public function buildBreadCrumb():void {
			breadCls = new BreadCrumb();
			addChild(breadCls);
		}
		public function destroyBreadCrumb():void {
			if (breadCls) {
				removeChild(breadCls);
				breadCls=null;
			}
		}
		
		/* Help */
		public function buildHelp():void {
			helpCls = new Help();
			addChild(helpCls);
		}
		public function destroyHelp():void {
			if (helpCls) {
				removeChild(helpCls);
				helpCls=null;
			}
		}
		
		/* Deal Done */
		public function buildDealDone():void {
			loadDealDone( swfsPath + "deal-ok.swf");
		}
		
		
		

		/*
		************************************************************************************************************
		_load remoting configurations
		*/
		function loadConfigurations() {
			var _service = new NetConnection();
			_service.connect(key);
			var responder=new Responder(get_configurations,onFault);
			_service.call("AddOnCars.getVariable", responder , 'remote_config');
		}
		function get_configurations(rs:Object) {
			
			var resultArr:Array = JSON.decode(rs.serverInfo.initialData[0][2]);
			
			//Trace("Response==>"+rs.serverInfo.initialData[0][1]);
			hostDomain               = resultArr[0].hostDomain;
			gateWay    			     = hostDomain + resultArr[0].gateWay;
			effectAccessoriesFiles   = hostDomain + resultArr[0].effected;
			accessoriesIconFiles     = hostDomain + resultArr[0].icons;
			smallViewsFiles          = hostDomain + resultArr[0].smallviews;
			canvesViewsFiles         = hostDomain + resultArr[0].canvesviews;
			backgroundFiles          = hostDomain + resultArr[0].backgrounds;
			uploadScript             = hostDomain + resultArr[0].uploadScript;
			dealerLogoFile			 = hostDomain + resultArr[0].DealerLogoFiles;
			makeFiles                = hostDomain + resultArr[0].MakeFiles;
			
			// *** disable for error on local testings
			//getValuesFromHtml();    
			buildBackground();
			buildWorkspace();
			buildBreadCrumb();
			
		}
		public function onFault(f:Event ) {
			trace("There was a problem");
			Trace("Remote Connection Problem Found");
		}


		
		/*
		**********************************************************************************************************
		load Done Window
		*/
		function loadDealDone(url:String) {
			doneLoader = new Loader();
			doneLoader.load(new URLRequest(url));
			doneLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, dealDoneLoaded);
		}
		function dealDoneLoaded(e:Event):void {
			doneMC = new MovieClip();
			doneMC = e.currentTarget.content as MovieClip;
			addChild(doneMC);
			doneMC.x=315;
			doneMC.y=220;
			
			doneMC.cancel_btn.addEventListener(MouseEvent.CLICK, destroyDealDone );
			doneMC.done_btn.addEventListener(MouseEvent.CLICK, dealDoneHandler );
		}
		
		
		public function destroyDealDone(e:MouseEvent):void {
			if (doneMC) {
				removeChild(doneMC);
				doneMC=null;
			}
		}
		
		public function dealDoneHandler(e:MouseEvent):void{
			if(Cart.cartArr.length > 0){
				trace("clicked");
				var targetURL:URLRequest = new URLRequest( invoicePath + InvoiceNO );
				navigateToURL(targetURL , "_blank");
				if (doneMC) {
					removeChild(doneMC);
					doneMC = null;
				}
			}
		}
		
		
		/* Debug Mode */
		public function debug():void {
			for (var i:uint = 0; i < bgCls.numChildren; i++) {
				trace(i+'.\t name:' + bgCls.getChildAt(i).name + '\t type:' + typeof (bgCls.getChildAt(i))+ '\t' + bgCls.getChildAt(i));
			}
		}

		
		public function Trace($str):void{
			var myText:TextField = new TextField();
			var _format:TextFormat = new TextFormat();
			_format.size = 16;
			_format.align = TextFormatAlign.CENTER;
			_format.bold = true;
			myText.defaultTextFormat = _format;
			myText.text = $str;
			myText.width = 300;
			addChild(myText);
			myText.x = 100;
			myText.y = 100;
		}



	}//$class
}//$package
