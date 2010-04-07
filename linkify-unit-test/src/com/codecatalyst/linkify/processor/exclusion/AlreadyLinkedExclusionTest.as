package com.codecatalyst.linkify.processor.exclusion
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;

	public class AlreadyLinkedExclusionTest extends Assert
	{
		protected var exclusion:AlreadyLinkedExclusion;
		
		[Before]
		public function setUp():void
		{
			exclusion = new AlreadyLinkedExclusion();
		}

		[Test]
		public function returnsTrueIfAlreadyLinked():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">match</a>", 14, 19, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\" target=\"blank\">match</a>", 29, 34, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">leftmatchright</a>", 18, 23, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">left</a><a href=\"url\">match</a><a>right</a>", 36, 41, [] ) ) );
		}
		
		[Test]
		public function returnsFalseIfNotAlreadyLinked():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "leftmatchright", 4, 9, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">left</a>match", 22, 27, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match<a href=\"url\">right</a>", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">left</a>match<a href=\"url\">right</a>", 22, 27, [] ) ) );
		}
	}
}