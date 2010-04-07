package com.codecatalyst.linkify.processor.exclusion
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	public class DifferentSchemeExclusionTest extends Assert
	{
		protected var exclusion:DifferentSchemeExclusion;
		
		[Before]
		public function setUp():void
		{
			exclusion = new DifferentSchemeExclusion( "expectedScheme://" );
		}
		
		[Test]
		public function returnsTrueIfMatchHasDifferentScheme():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "unexpectedScheme:location", "unexpectedScheme:location", 0, 25, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "unexpectedScheme://location", "unexpectedScheme://location", 0, 27, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "expectedScheme:location", "expectedScheme:location", 0, 23, [] ) ) );
		}
		
		[Test]
		public function returnsFalseMatchHasExpectedScheme():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "location", "location", 0, 8, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "location?unexpectedScheme://", "location?unexpectedScheme://", 0, 28, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "expectedScheme://location", "expectedScheme://location", 0, 25, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "expectedScheme://location?expectedScheme://", "expectedScheme://location?expectedScheme://", 0, 43, [] ) ) );
		}
	}
}