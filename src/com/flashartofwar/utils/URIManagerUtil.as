package com.flashartofwar.utils
{

	/**
	 * 
	 */
	public class URIManagerUtil
	{
		private static var __instance : URIManagerUtil;
		private var uris : Array = [];

		/**
		 * Constructor can only be called by the static instance method.
		 * 
		 */
		public function URIManagerUtil(enforcer : SingletonEnforcer)
		{       
			if (enforcer == null) 
			{
				throw new Error( "Error: Instantiation failed: Use URIManagerUtil.instance instead." );
			}
		}

		/**
		 * Creates a new instance of URIManagerUtil if one does not currently exist.
		 * 
		 * @return URIManagerUtil
		 */   
		public static function get instance() : URIManagerUtil
		{
			if(URIManagerUtil.__instance == null) 
			{
				URIManagerUtil.__instance = new URIManagerUtil( new SingletonEnforcer( ) );
			}
			return URIManagerUtil.__instance;
		}

		/**
		 * Use this method to add a URI into the utility.
		 * 
		 * @param name this is the name of the URI. You will need to use this
		 * when requesting a URI from the utility.
		 * @param path the path of the URI. You can put ${tokens} in the path
		 * to be used when requesting out later.
		 */
		public function addURI( name : String, path : String ) : void
		{
			uris[ name ] = path;
		}       

		/**
		 * This returns a URI from the manager. 
		 * 
		 * @param name this is the name of the URI
		 * @param token this is the object that contains values to use to 
		 * replace tokens in the url. Each property of the object will be
		 * tested against a ${token} with a similar name. If a match is
		 * found, the properties value will replace the token.
		 */
		public function getURI( name : String, token : Object = null ) : String
		{
			var uriMethod : String = "";
                        
			uriMethod = uris[ name ] ? uris[ name ] : "";
                        
			return TokenUtil.replaceTokens( uriMethod, token );
		}               
	}
}

internal class SingletonEnforcer 
{
}
