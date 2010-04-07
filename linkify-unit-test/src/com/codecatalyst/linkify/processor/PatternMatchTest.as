package com.codecatalyst.linkify.processor
{
	import org.flexunit.Assert;

	public class PatternMatchTest extends Assert
	{
		[Test]
		public function populatesLeftTextAndRightText():void
		{
			var match:PatternMatch = new PatternMatch( "match", "leftmatchright", 4, 9, [] );
			
			assertEquals( match.leftText, "left" );
			assertEquals( match.rightText, "right" );
		}
	}
}