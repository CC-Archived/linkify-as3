package com.codecatalyst.linkify.processor.pattern
{
	import org.flexunit.Assert;
	
	public class EmailAddressPatternTest extends Assert
	{
		protected const pattern:RegExp = EMAIL_ADDRESS_PATTERN;
		
		[Test]
		public function matchesExpectedValues():void
		{
			var match:Object = null;

			pattern.lastIndex = 0;
			match = pattern.exec( "example.com" );
			assertEquals( null, match );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "userid@example.com" );
			assertEquals( "userid@example.com", match[ 0 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "USERID@EXAMPLE.COM" );
			assertEquals( "USERID@EXAMPLE.COM", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "mailto:userid@example.com" );
			assertEquals( "userid@example.com", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "(userid@example.com)" );
			assertEquals( "userid@example.com", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "E-mail address: userid@example.com.");
			assertEquals( "userid@example.com", match[ 0 ] );
		}
	}
}