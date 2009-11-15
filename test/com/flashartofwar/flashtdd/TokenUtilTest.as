package com.flashartofwar.flashtdd 
{
	import com.flashartofwar.utils.TokenUtil;

	import flexunit.framework.Assert;

	/**
	 * @author jessefreeman
	 */
	public class TokenUtilTest
	{
		public function TokenUtilTest()
		{
		}

		[Test]

		public function replaceTokensInString() : void
		{
			var madLibsSentance : String = "Today I went to the zoo. I saw a ${adjective} ${noun} jumping up and down in its tree.";
			
			var tokens : Object = {adjective: "Flash", noun: "Bum"};
			
			var replacedSentance : String = TokenUtil.replaceTokens( madLibsSentance, tokens );
			
			Assert.assertEquals( replacedSentance, "Today I went to the zoo. I saw a Flash Bum jumping up and down in its tree." );
		}
	}
}
