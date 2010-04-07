package com.codecatalyst.linkify.processor.transform.formatter
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	public class CharacterFilterFormatterTest extends Assert
	{
		[Test]
		public function returnsCorrectlyFormattedValue():void
		{
			var formatter:CharacterFilterFormatter = null;

			formatter = new CharacterFilterFormatter( "B" );
			assertEquals( "bBbB", formatter.format( new PatternMatch( "abABabAB", "abABabAB", 0, 8, [] ) ) );
			
			formatter = new CharacterFilterFormatter( "B", false );
			assertEquals( "BB", formatter.format( new PatternMatch( "abABabAB", "abABabAB", 0, 8, [] ) ) );

			formatter = new CharacterFilterFormatter( "0-9" );
			assertEquals( "1234", formatter.format( new PatternMatch( "a1b2c3d4", "a1b2c3d4", 0, 8, [] ) ) );
			
			formatter = new CharacterFilterFormatter( "a-z" );
			assertEquals( "abcd", formatter.format( new PatternMatch( "a1b2c3d4", "a1b2c3d4", 0, 8, [] ) ) );
			
			formatter = new CharacterFilterFormatter( "a-z0-9" );
			assertEquals( "a1b2c3d4", formatter.format( new PatternMatch( "a1b2c3d4", "a1b2c3d4", 0, 8, [] ) ) );
			
			formatter = new CharacterFilterFormatter( "\\/|()[]^$&.*?+-" );
			assertEquals( "\\/|()[]^$&.*?+-", formatter.format( new PatternMatch( "\\/|()[]^$&.*?+-", "\\/|()[]^$&.*?+-", 0, 16, [] ) ) );
		}
	}
}