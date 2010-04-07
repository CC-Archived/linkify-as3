package com.codecatalyst.linkify.processor.pattern
{
	import org.flexunit.Assert;
	
	public class PhoneNumberPatternTest extends Assert
	{
		protected const pattern:RegExp = PHONE_NUMBER_PATTERN;
		
		[Test]
		public function matchesExpectedValues():void
		{
			var match:Object = null;
			
			pattern.lastIndex = 0;
			match = pattern.exec( "text" );
			assertEquals( null, match );

			pattern.lastIndex = 0;
			match = pattern.exec( "Phone number: 555 123-4567.");
			assertEquals( "555 123-4567", match[ 0 ] );
			assertEquals( null, match[ 1 ] );
			assertEquals( "555", match[ 2 ] );
			assertEquals( "123", match[ 3 ] );
			assertEquals( "4567", match[ 4 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "Phone number: 555-123-4567.");
			assertEquals( "555-123-4567", match[ 0 ] );
			assertEquals( null, match[ 1 ] );
			assertEquals( "555", match[ 2 ] );
			assertEquals( "123", match[ 3 ] );
			assertEquals( "4567", match[ 4 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "Phone number: (555) 123-4567." );
			assertEquals( "(555) 123-4567", match[ 0 ] );
			assertEquals( null, match[ 1 ] );
			assertEquals( "(555)", match[ 2 ] );
			assertEquals( "123", match[ 3 ] );
			assertEquals( "4567", match[ 4 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "Phone number: +1 (555) 123-4567." );
			assertEquals( "+1 (555) 123-4567", match[ 0 ] );
			assertEquals( "+1 ", match[ 1 ] );
			assertEquals( "(555)", match[ 2 ] );
			assertEquals( "123", match[ 3 ] );
			assertEquals( "4567", match[ 4 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "Phone number: +1 555 123-4567." );
			assertEquals( "+1 555 123-4567", match[ 0 ] );
			assertEquals( "+1 ", match[ 1 ] );
			assertEquals( "555", match[ 2 ] );
			assertEquals( "123", match[ 3 ] );
			assertEquals( "4567", match[ 4 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "Phone number: +1-555-123-4567." );
			assertEquals( "+1-555-123-4567", match[ 0 ] );
			assertEquals( "+1", match[ 1 ] );
			assertEquals( "555", match[ 2 ] );
			assertEquals( "123", match[ 3 ] );
			assertEquals( "4567", match[ 4 ] );
		}
	}
}