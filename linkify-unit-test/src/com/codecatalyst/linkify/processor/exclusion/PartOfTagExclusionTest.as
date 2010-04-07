package com.codecatalyst.linkify.processor.exclusion
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	public class PartOfTagExclusionTest extends Assert
	{
		protected var exclusion:PartOfTagExclusion;
		
		[Before]
		public function setUp():void
		{
			exclusion = new PartOfTagExclusion();
		}
		
		[Test]
		public function returnsTrueIfMatchPartOfTag():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<tag attribute=\"match\"/>", 16, 21, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<tag attribute=\"match\">value</tag>", 16, 21, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<tag><tag attribute=\"match\">value</tag></tag>", 21, 26, [] ) ) );
		}
		
		[Test]
		public function returnsFalseIfMatchNotPartOfTag():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "leftmatchright", 4, 9, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "<tag>left</tag>match", 15, 20, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match<tag>right</tag>", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "<tag>left</tag>match<tag>right</tag>", 15, 20, [] ) ) );
		}		
	}
}