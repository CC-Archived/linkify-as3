package com.codecatalyst.linkify.processor.exclusion
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	public class RequireSchemeExclusionTest extends Assert
	{
		protected var exclusion:RequireSchemeExclusion;
		
		[Before]
		public function setUp():void
		{
			exclusion = new RequireSchemeExclusion( "expected://" );
		}
		
		[Test]
		public function returnsTrueIfMatchInsideTag():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "location", "location", 0, 8, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "unexpected:location", "unexpected:location", 0, 19, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "unexpected://location", "unexpected://location", 0, 21, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "expected:location", "expected:location", 0, 17, [] ) ) );
		}
		
		[Test]
		public function returnsFalseIfMatchNotInsideTag():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "expected://location", "expected://location", 0, 19, [] ) ) );
		}
	}
}