package com.main{

	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.events.*;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.SimpleButton;
	import flash.net.NetConnection;
	import flash.net.Responder;

	import gs.TweenLite;
	import com.adobe.serialization.json.JSON;
	import com.parts.*;


	public class ViewHandlers extends MovieClip {

		public var _frontButton:MovieClip;
		public var _rearButton:MovieClip;
		public var _interiorButton:MovieClip;

		public function ViewHandlers() {
			FrontView();
			RearView();
			InteriorView();
		}

		public function FrontView():void {
			_frontButton = new MovieClip();
			_frontButton.graphics.beginFill(0xafaeae);
			_frontButton.graphics.drawRect(0,0,194,105);
			_frontButton.graphics.endFill();
			addChild(_frontButton);
			_frontButton.x=0;
			_frontButton.y=0;
			_frontButton.alpha=0;
			_frontButton.buttonMode=true;
			_frontButton.addEventListener(MouseEvent.CLICK , frontHandler);
		}
		public function RearView():void {
			_rearButton = new MovieClip();
			_rearButton.graphics.beginFill(0xafaeae);
			_rearButton.graphics.drawRect(0,0,194,105);
			_rearButton.graphics.endFill();
			addChild(_rearButton);
			_rearButton.x=0;
			_rearButton.y=130;
			_rearButton.alpha=0;
			_rearButton.buttonMode=true;
			_rearButton.addEventListener(MouseEvent.CLICK , rearHandler);
		}
		public function InteriorView():void {
			_interiorButton = new MovieClip();
			_interiorButton.graphics.beginFill(0xafaeae);
			_interiorButton.graphics.drawRect(0,0,194,105);
			_interiorButton.graphics.endFill();
			addChild(_interiorButton);
			_interiorButton.x=0;
			_interiorButton.y=258;
			_interiorButton.alpha=0;
			_interiorButton.buttonMode=true;
			_interiorButton.addEventListener(MouseEvent.CLICK , interiorHandler);
		}


		public function frontHandler(e:MouseEvent) {
			frontViewBT();
		}

		public function rearHandler(e:MouseEvent) {
			rearViewBT();
		}

		public function interiorHandler(e:MouseEvent) {
			interiorViewBT();
		}



		public function frontViewBT() {
			Main.VIEW_CONTROL_VAR = "FVIEW";
			updateApplication(Main.VIEW_CONTROL_VAR);
			MovieClip(parent).highLightCls.smallBox.y = 0;

			with (MovieClip(parent)) {
				canvesMC_front.visible=true;// Load canves 
				canvesMC_rear.visible=false;
				canvesMC_interior.visible=false;
				TweenLite.from(canvesMC_front, 0.50, {alpha:0 });
			}

		}

		public function rearViewBT() {
			Main.VIEW_CONTROL_VAR = "RVIEW";
			updateApplication(Main.VIEW_CONTROL_VAR);
			MovieClip(parent).highLightCls.smallBox.y = 130;

			with (MovieClip(parent)) {
				canvesMC_front.visible=false;// Load canves
				canvesMC_rear.visible=true;
				canvesMC_interior.visible=false;
				TweenLite.from(canvesMC_rear, 0.50, {alpha:0 });
			}
		}

		public function interiorViewBT() {
			Main.VIEW_CONTROL_VAR = "IVIEW";
			updateApplication(Main.VIEW_CONTROL_VAR);
			MovieClip(parent).highLightCls.smallBox.y=258;

			with (MovieClip(parent)) {
				canvesMC_front.visible=false;// Load canves
				canvesMC_rear.visible=false;
				canvesMC_interior.visible=true;
				TweenLite.from(canvesMC_interior, 0.50, {alpha:0 });
			}
		}


		public function otherViewBT() {
			Main.VIEW_CONTROL_VAR = "OVIEW";
			updateApplication(Main.VIEW_CONTROL_VAR);
			MovieClip(parent).highLightCls.smallBox.y=258;

			with (MovieClip(parent)) {
				canvesMC_front.visible=false;// Load canves
				canvesMC_rear.visible=false;
				canvesMC_interior.visible=true;
				TweenLite.from(canvesMC_interior, 0.50, {alpha:0 });
			}
		}

		public function updateApplication(VIEW_CONTROL_VAR) {
			checkInClipParts(Main.VIEW_CONTROL_VAR);
			checkInClipWheels(Main.VIEW_CONTROL_VAR);
		}
		
		
		
		public function checkInClipParts(VIEW_CONTROL_VAR) {
			for (var i:Number = 0; i < EffectedParts.shopContainer.numChildren; i++) {
				if (EffectedParts.shopContainer.getChildAt(i) is Parts) {
					var target:MovieClip = EffectedParts.shopContainer.getChildByName(EffectedParts.shopContainer.getChildAt(i).name) as MovieClip;
					target.updateApplication(Main.VIEW_CONTROL_VAR);
				}
			}
		}

		public function checkInClipWheels(VIEW_CONTROL_VAR) {
			for (var i:Number = 0; i < EffectedParts.shopContainer.numChildren; i++) {
				if (EffectedParts.shopContainer.getChildAt(i) is Wheels) {
					var target:MovieClip = EffectedParts.shopContainer.getChildByName(EffectedParts.shopContainer.getChildAt(i).name) as MovieClip;
					target.updateApplication(Main.VIEW_CONTROL_VAR);
				}
			}
		}





	}//$class
}//$package