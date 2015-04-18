package com.djw.events.io {
	import flash.events.Event;

	public class UploadFailedEvent extends Event {
		
		public function UploadFailedEvent() {
			super("uploadFailedEvent", true);
		}
		
	}
	
}
