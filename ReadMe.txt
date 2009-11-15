Flash URIManagerUtil 

Author: Jesse Freeman aka The Flash Bum
Email: jesse@flashbum.com
Web: http://flashbum.com
Twitter: @TheFlashBum

Copyright (c) <year> <copyright holders>

 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:

 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
Running the ANT Build:

Thank you for downloading my URIManagerUtil. Here is a quick guide to getting started and how to use the library.

First, make sure you have ANT installed on your computer.

Copy the build.template.properties file and rename it to build.properties.

Change the path to your FLEX_HOME to where you put the Flex SDK (needs version 4.0.0)

The ANT file is automatically set up to run the Unit Test, generate AS Docs, and build a SWC.

That should be everything you need to know about running the ANT build, here is how to use the utility: 


Cong XML example

<config>
	<uris handler="parseURIs">
		<uri name="locations"><![CDATA[xml/locations/${filename}.xml]]></uri>
		<uri name="fonts"><![CDATA[swfs/fonts/${filename}.swf]]></uri>
		<uri name="css"><![CDATA[css/${filename}.css]]></uri>
		<uri name="decalsheets"><![CDATA[xml/${filename}.xml]]></uri>
		<uri name="selectContainer"><![CDATA[${location}/container/${id}/view/front]]></uri>
	</uris>
</config>


Doc class example that loads config xml and sets up URIManager

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
