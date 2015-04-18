
package com.djw.io {
	//import fl.controls.ProgressBar;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.events.Event;
	//import flash.events.ProgressEvent;
	import flash.events.MouseEvent;
	import com.djw.events.io.*;
	
	public class FileUploader extends MovieClip {
		
		//public var phpUploadScript:String = "http://localhost/addons/upload2/upload.php";
		public var phpUploadScript:String = "http://www.realtypakistan.net/pro/upload.php";
		public var uploadDir:String = "";
		public var uploadURL:URLRequest;
		
		public var progress_txt:TextField;
		//public var progress_bar:ProgressBar;
		public var bg_mc:MovieClip;
		
		public var random_file_name:String;
		
		private var _fileRef:FileReference = new FileReference();
		
		public function FileUploader(uploadDir:String = "") {
			this.uploadDir = uploadDir;
			this.uploadURL = new URLRequest(this.phpUploadScript + "?uploadDir=" + this.uploadDir);
			
			
			
			//event handlers
			this._fileRef.addEventListener(Event.SELECT, this.selectFile);
			this._fileRef.addEventListener(Event.OPEN, this.openFile);
			this._fileRef.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.httpStatus);
			this._fileRef.addEventListener(Event.COMPLETE, this.completeUpload);
			this._fileRef.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
			this._fileRef.addEventListener(IOErrorEvent.IO_ERROR, this.ioError);
			this._fileRef.addEventListener(Event.CANCEL, this.cancel);
			//this._fileRef.addEventListener(ProgressEvent.PROGRESS, this.uploadProgress);
			this._fileRef.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, this.uploadComplete);
			
			//setup the progress bar
			//this.progress_bar.source = this._fileRef;
			//this.progress_bar.indeterminate = false;
			
			//make the whole thing draggable for fun
			this.buttonMode = true;
			this.useHandCursor = true;
			this.addEventListener(MouseEvent.MOUSE_DOWN, this.startDragger);
			this.addEventListener(MouseEvent.MOUSE_UP, this.stopDragger);
			
			//stop
			this.stop();
			
		}
		
		public function startUpload():void{
			this.browse();
		}
		
		
		public function browse():void {
			this._fileRef.browse([new FileFilter("All Formats (*.jpg,*.gif,*.png,*.swf)", "*.jpg;*.gif;*.png;*.swf", "JPEG;jp2_;GIFF;SWFL")]);
		}
		
		private function selectFile(e:Event):void {
			trace(" [FileUploader] File Selected");
			
			//upload the file
			this._fileRef.upload(this.uploadURL);
		}
		
		private function openFile(e:Event):void {
			trace(" [FileUploader] File Upload Started");
		}
		
		private function completeUpload(e:Event):void {
			trace(" [FileUploader] File Upload Complete");
		}
		
		private function httpStatus(e:HTTPStatusEvent) {
			trace(" [FileUploader] HTTP Status: " + e.status);
			this.dispatchEvent(new UploadFailedEvent());
		}
		
		private function securityError(e:SecurityErrorEvent) {
			trace(" [FileUploader] Security Error: " + e.text);
			this.dispatchEvent(new UploadFailedEvent());
		}
		
		private function ioError(e:IOErrorEvent) {
			trace(" [FileUploader] IOError: " + e.text);
			this.dispatchEvent(new UploadFailedEvent());
		}
		
		private function cancel(e:Event):void {
			this.close();
		}
		
		public function getFileName():String{
				return _fileRef.name;
		}
		
		private function close(...args:Array):void {
			this.parent.removeChild(this);
			delete this; //mark for gc
		}
		
		/*
		private function uploadProgress(e:ProgressEvent):void {
			trace(" [FileUploader] progress: " + e.bytesLoaded + " / " + e.bytesTotal);
			this.progress_bar.setProgress(e.bytesLoaded, e.bytesTotal);
			//this.progress_txt.text = Math.round((e.bytesLoaded / e.bytesTotal) * 100) + "%";
		}
		*/
		
		private function uploadComplete(e:DataEvent):void {
			// Here we get response from PHP file
			
			//trace("%"+ e.data +"%");
			this.randomFileName = e.data; 
			trace(" [FileUploader] File Upload DATA Complete");
			
			//show the user its done
			this.gotoAndStop(2);
			
			//add a listener to kill it when they click
			this.addEventListener(MouseEvent.CLICK, this.close);
			
			this.dispatchEvent(new UploadCompleteEvent());
		}
		
		public function get randomFileName():String {
			return random_file_name;
		}

		public function set randomFileName(value:String):void {
			random_file_name = value;
		}

		
		
		private function startDragger(e:MouseEvent):void {
			this.startDrag(false);
		}
		
		private function stopDragger(e:MouseEvent):void {
			this.stopDrag();
		}
		
	}
	
}
