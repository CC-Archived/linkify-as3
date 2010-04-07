package com.codecatalyst.linkify.processor.exclusion
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	public class PreceededByNonWhitespaceExclusionTest extends Assert
	{
		protected var exclusion:PreceededByNonWhitespaceExclusion;
		
		[Before]
		public function setUp():void
		{
			exclusion = new PreceededByNonWhitespaceExclusion();
		}
		
		[Test]
		public function returnsTrueIfMatchPreceededByNonWhitespace():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "leftmatch", 4, 9, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "mailto:match", 7, 12, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "email@match", 6, 11, [] ) ) );
		}
		
		[Test]
		public function returnsFalseIfMatchPreceededByWhitespace():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", " match", 1, 6, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "	match", 1, 6, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "\nmatch", 1, 6, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "\rmatch", 1, 6, [] ) ) );
		}		
	}
}