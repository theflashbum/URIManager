package 
{
	import com.flashartofwar.utils.URIManagerUtil;

	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.display.Sprite;

	/**
	 * @author jessefreeman
	 */
	public class URIManagerExamples extends Sprite 
	{
		private var loader : URLLoader;
		private var uriManager : URIManagerUtil;

		public function URIManagerExamples() 
		{
			
			loadConfig( );
		}

		private function loadConfig() : void
		{
			loader = new URLLoader( );
			loader.addEventListener( Event.COMPLETE, onConfigLoad );
			loader.load( new URLRequest( "xml/config.xml" ) );
		}

		private function onConfigLoad(event : Event) : void 
		{
			parseURIs( XML( event.target.data ) );
		}

		private function parseURIs(xml : XML) : void 
		{
			
			var uriList : XMLList = xml.uris.*;
			
			uriManager = URIManagerUtil.instance;
			var uri : XML;
			
			for each (uri in uriList) 
			{
				uriManager.addURI( uri.@name, uri.toString( ) );
			}
			
			testURIManager( );
		}

		private function testURIManager() : void 
		{
			
			// Test 1
			trace( "locations \n", uriManager.getURI( "locations" ) + "\n", uriManager.getURI( "locations", {filename: "eastvillage"} ), "\n" );
			
			// Test 2
			trace( "fonts \n", uriManager.getURI( "fonts" ) + "\n", uriManager.getURI( "fonts", {filename: "FontLibrary"} ), "\n" );
			
			// Test 3
			trace( "selectContainer \n", uriManager.getURI( "selectContainer" ) + "\n", uriManager.getURI( "selectContainer", {location: "eastvillage", id:"1"} ), "\n" );
		}
	}
}
