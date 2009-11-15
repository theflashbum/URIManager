package com.flashartofwar.flashtdd 
{
	import com.flashartofwar.utils.URIManagerUtil;

	import org.flexunit.Assert;

	/**
	 * @author jessefreeman
	 */
	public class URIManagerUtilTest 
	{
		protected var uriManager : URIManagerUtil = URIManagerUtil.instance;

		public function get configXML() : XML
		{
			var xml : XML = <config>
								<uris handler="parseURIs">
									<uri name="locations"><![CDATA[xml/locations/${filename}.xml]]></uri>
									<uri name="fonts"><![CDATA[swfs/fonts/${filename}.swf]]></uri>
									<uri name="css"><![CDATA[css/${filename}.css]]></uri>
									<uri name="decalsheets"><![CDATA[xml/${filename}.xml]]></uri>
									<uri name="selectContainer"><![CDATA[${location}/container/${id}/view/front]]></uri>
								</uris>
							</config>;
		
			return xml; 
		}

		[Before]

		public function runBeforeEveryTest() : void 
		{ 
			var uriList : XMLList = configXML.uris.*;
			
			uriManager = URIManagerUtil.instance;
			var uri : XML;
			
			for each (uri in uriList) 
			{
				uriManager.addURI( uri.@name, uri.toString( ) );
			}
		} 

		[Test]

		public function testGetURIWithOneToken() : void 
		{	
			var tokens : Object = {filename: "eastvillage"};
			
			var uri : String = uriManager.getURI( "locations", tokens );
			
			Assert.assertEquals( uri, "xml/locations/eastvillage.xml" );
		}

		[Test]

		public function testGetURIWithNoTokens() : void 
		{
			var uri : String = uriManager.getURI( "fonts" );
			
			Assert.assertEquals( uri, "swfs/fonts/${filename}.swf" );
		}

		[Test]

		public function testGetURIWithMultipleTokens() : void 
		{
			
			var tokens : Object = {location: "eastvillage", id:"1"};
			
			var uri : String = uriManager.getURI( "selectContainer", tokens );
			
			Assert.assertEquals( uri, "eastvillage/container/1/view/front" );
		}
	}
}
