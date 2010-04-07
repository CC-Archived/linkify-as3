package com.codecatalyst.linkify.processor.exclusion
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	public class StartsWithAtSignExclusionTest extends Assert
	{
		protected var exclusion:StartsWithAtSignExclusion;
		
		[Before]
		public function setUp():void
		{
			exclusion = new StartsWithAtSignExclusion();
		}
		
		[Test]
		public function returnsTrueIfMatchStartsWithAtSign():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "@match", "@match", 0, 5, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "@match", "left@matchright", 4, 10, [] ) ) );
		}
		
		[Test]
		public function returnsFalseIfMatchDoesNotStartWithAtSign():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "email@address", "email@address", 0, 13, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "@match@", 1, 6, [] ) ) );
		}
	}
}