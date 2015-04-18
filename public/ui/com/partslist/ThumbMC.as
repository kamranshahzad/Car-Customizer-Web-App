package com.partslist{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.text.*;
	
	import com.main.*;
	
	public class ThumbMC extends MovieClip{
		
		var loader:Loader;
		
		private var Container:MovieClip;
		private var imgMC:MovieClip;
		private var imgSrc:String = "";
		
		//private var _txtFormat:PartListText;
		
		
		public function ThumbMC($imgSrc:String , $partLbl:String , $price:Number , $manu:String , $sku:String ,$des:String, $status:Number )
		{
			Container = new MovieClip();
			Container.graphics.lineStyle(2, 0xbab8b8);
			Container.graphics.beginFill(0xFFFFFF);
			Container.graphics.drawRoundRect(0, 0, 500 , 345 , 15, 15);
			Container.graphics.endFill();
			Container.graphics.endFill();
			addChild(Container);
			
			
			this.imgSrc = $imgSrc;
			
			drawTitleBar($partLbl);
			drawPart();
			setPriceText("$"+$price);
			setLabelsText();
			setManufactureText($manu);
			setSKUText($sku);
			if($status == 1){
				setStatusText("Avalible");
			}else{
				setStatusText("Not-Avalible");
			}
			setDescriptionText($des);
		}
		
		public function drawTitleBar(_titleTxt:String):void{
			var bg:Sprite = new Sprite();
			bg.graphics.lineStyle(2,0xbab8b8);
			bg.graphics.beginFill(0xcdcdcd);
			bg.graphics.drawRect(10,10,480,30);
			bg.graphics.endFill();
			
			Container.addChild(bg);
			
			var titleTxt:TextField = new TextField();// _txtFormat.createListText( _titleTxt, 3 , 14 , 15 );
			titleTxt.selectable=false;
			titleTxt.text = _titleTxt;
			titleTxt.x = 14;
			titleTxt.y = 15;
			titleTxt.width = 450;
			bg.addChild(titleTxt);
			titleTxt.setTextFormat(PartTextFormat.setWinTitleBar());
		}
	
		public function drawPart():void{
			imgMC = new MovieClip();
			imgMC.graphics.lineStyle(2, 0xcdcdcd);
			
			Container.addChild(imgMC);
			
			loadPartImage(this.imgSrc);
		}
		
		function loadPartImage(url:String):void {
			loader = new Loader();
			loader.load(new URLRequest(url));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, partImageLoaded );
		}

		public function partImageLoaded(event:Event):void {
			var thumbContent:DisplayObject = event.target.content;
			imgMC.addChild(thumbContent);
			imgMC.width = 300;
			imgMC.height = 175;
			imgMC.x = 10;
			imgMC.y = 50;
		}
		
		/*
			********************************************
			Text Setter functons
		*/
		
		public function setPriceText(txt:String):void{
			var priceTxt:TextField = new TextField();
			priceTxt.selectable=false;
			priceTxt.text = txt;
			priceTxt.x = 330;
			priceTxt.y = 70;
			Container.addChild(priceTxt);
			priceTxt.setTextFormat(PartTextFormat.setPriceText());
		}
		
		public function setManufactureText(txt:String):void{
			var manuTxt:TextField = new TextField(); 
			manuTxt.selectable=false;
			manuTxt.text = txt;
			manuTxt.x = 330;
			manuTxt.y = 140;
			Container.addChild(manuTxt);
			manuTxt.setTextFormat(PartTextFormat.setTooltipText());
		}
		
		public function setSKUText(txt:String):void{
			var skuTxt:TextField = new TextField(); 
			skuTxt.selectable=false;
			skuTxt.text = txt;
			skuTxt.x = 330;
			skuTxt.y = 178;
			Container.addChild(skuTxt);
			skuTxt.setTextFormat(PartTextFormat.setTooltipText());
		}
		
		public function setStatusText(txt:String):void{
			var statusTxt:TextField =  new TextField(); 
			statusTxt.selectable=false;
			statusTxt.text = txt;
			statusTxt.x = 330;
			statusTxt.y = 210;
			Container.addChild(statusTxt);
			statusTxt.setTextFormat(PartTextFormat.setTooltipText());
		}
		
		public function setDescriptionText(txt:String):void{
			var desTxt:TextField =  new TextField();
			desTxt.selectable=false;
			desTxt.text = txt;
			desTxt.x = 10;
			desTxt.y = 230;
			desTxt.width = 480;
			desTxt.height = 110;
			desTxt.multiline = true;
			desTxt.wordWrap = true;
			Container.addChild(desTxt);
			desTxt.setTextFormat(PartTextFormat.setTooltipText());
		}
		
		public function setLabelsText():void{
			var lbl1:TextField = new TextField();
			lbl1.text = "Manufacturer:";
			lbl1..x = 325;
			lbl1..y = 125;
			lbl1.selectable=false;
			var lbl2:TextField = new TextField();
			lbl2.text = "SKU:";
			lbl2.x = 325;
			lbl2.y = 160;
			lbl2.selectable=false;
			var lbl3:TextField = new TextField();
			lbl3.text = "Status:";
			lbl3.x = 325;
			lbl3.y = 195;
			lbl3.selectable=false;
			Container.addChild(lbl1);
			Container.addChild(lbl2);
			Container.addChild(lbl3);
			lbl1.setTextFormat(PartTextFormat.setLabelText());
			lbl2.setTextFormat(PartTextFormat.setLabelText());
			lbl3.setTextFormat(PartTextFormat.setLabelText());
		}
				
		
	} //$class
} //$package