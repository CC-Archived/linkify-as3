package com.codecatalyst.linkify.processor.pattern
{
	import org.flexunit.Assert;
	
	public class UrlPatternTest extends Assert
	{
		protected const pattern:RegExp = URL_PATTERN;
		
		[Test]
		public function matchesExpectedValues():void
		{
			var match:Object = null;
			
			pattern.lastIndex = 0;
			match = pattern.exec( "text" );
			assertEquals( null, match );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "http://foo.com/blah_blah" );
			assertEquals( "http://foo.com/blah_blah", match[ 0 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "(Something like http://foo.com/blah_blah)" );
			assertEquals( "http://foo.com/blah_blah", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://foo.com/blah_blah_(wikipedia)" );
			assertEquals( "http://foo.com/blah_blah_(wikipedia)", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "(Something like http://foo.com/blah_blah_(wikipedia))" );
			assertEquals( "http://foo.com/blah_blah_(wikipedia)", match[ 0 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "http://foo.com/blah_blah." );
			assertEquals( "http://foo.com/blah_blah", match[ 0 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "http://foo.com/blah_blah/." );
			assertEquals( "http://foo.com/blah_blah/", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "<http://foo.com/blah_blah>" );
			assertEquals( "http://foo.com/blah_blah", match[ 0 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "<http://foo.com/blah_blah/>" );
			assertEquals( "http://foo.com/blah_blah/", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://foo.com/blah_blah," );
			assertEquals( "http://foo.com/blah_blah", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://www.example.com/wpstyle/?p=364." );
			assertEquals( "http://www.example.com/wpstyle/?p=364", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://✪df.ws/123" );
			assertEquals( "http://✪df.ws/123", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "rdar://1234" );
			assertEquals( "rdar://1234", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "rdar:/1234" );
			assertEquals( "rdar:/1234", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://userid:password@example.com:8080" );
			assertEquals( "http://userid:password@example.com:8080", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://userid@example.com" );
			assertEquals( "http://userid@example.com", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://userid@example.com:8080" );
			assertEquals( "http://userid@example.com:8080", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://userid:password@example.com" );
			assertEquals( "http://userid:password@example.com", match[ 0 ] );
					
			pattern.lastIndex = 0;
			match = pattern.exec( "http://example.com:8080 x-yojimbo-item://6303E4C1-xxxx-45A6-AB9D-3A908F59AE0E" );
			assertEquals( "http://example.com:8080", match[ 0 ] );
			match = pattern.exec( "http://example.com:8080 x-yojimbo-item://6303E4C1-xxxx-45A6-AB9D-3A908F59AE0E" );
			assertEquals( "x-yojimbo-item://6303E4C1-xxxx-45A6-AB9D-3A908F59AE0E", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "message://%3c330e7f8409726r6a4ba78dkf1fd71420c1bf6ff@mail.gmail.com%3e" );
			assertEquals( "message://%3c330e7f8409726r6a4ba78dkf1fd71420c1bf6ff@mail.gmail.com%3e", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "http://➡.ws/䨹" );
			assertEquals( "http://➡.ws/䨹", match[ 0 ] );
			
			pattern.lastIndex = 0;
			match = pattern.exec( "www.➡.ws/䨹" );
			assertEquals( "www.➡.ws/䨹", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "<tag>http://example.com</tag>" );
			assertEquals( "http://example.com", match[ 0 ] );

			pattern.lastIndex = 0;
			match = pattern.exec( "Just a www.example.com link." );
			assertEquals( "www.example.com", match[ 0 ] );							
		}		
	}
}