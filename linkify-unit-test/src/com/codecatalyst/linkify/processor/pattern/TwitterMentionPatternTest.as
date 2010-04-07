package com.codecatalyst.linkify.processor.pattern
{
	import org.flexunit.Assert;
	
	public class TwitterMentionPatternTest extends Assert
	{
		protected const pattern:RegExp = TWITTER_MENTION_PATTERN;
		
		[Test]
		public function matchesExpectedValues():void
		{
			var match:Object = null;
			
			pattern.lastIndex = 0;
			match = pattern.exec( "text" );
			assertEquals( null, match );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "@ text" );
			assertEquals( null, match );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "RT @username_1234");
			assertEquals( "@username_1234", match[ 0 ] );
			assertEquals( "username_1234", match[ 1 ] );
		}
	}
}