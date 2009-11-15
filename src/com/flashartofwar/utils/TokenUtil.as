package com.flashartofwar.utils
{
 	public class TokenUtil
 	{
  		public static const CURLY_BRACES_PATTERN:RegExp = /\$\{([\w'-]+)\}/g;
   		public static const BRACKET_PATTERN:RegExp = /\$\[([\w'-]+)\]/g;
   		
   		/**
   		 * This util will take a string, search for ${tokens} and replace them 
   		 * with the values in the supplied object.
   		 * @param text - text you would like to search for tokens
   		 * @param paramObj - an object to use to find and replace tokens with
   		 * @param replaceUndefineds - string to use when undefined are found
   		 * @param overrideRegEx - override the default regex pattern
   		 * @return 
   		 * 
   		 */		
   		public static function replaceTokens(text:String, paramObj: Object, replaceUndefineds:String = "", overrideRegEx:RegExp = null) : String{
    		    if(!paramObj){
     		    	return text;
     		    }else{
     		    	var myRegEx:RegExp = overrideRegEx ? overrideRegEx : CURLY_BRACES_PATTERN;
     		   		
     		   		var cleanText:String = text.replace(myRegEx,function():*{return paramObj[arguments[1]];});
     			
     				cleanText = cleanText.replace(/undefined/gi,replaceUndefineds);
     					
     		   		return cleanText;
     		   		
     		    }
    		}
   		
   	}
 }
