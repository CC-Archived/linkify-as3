////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2010 CodeCatalyst, LLC - http://www.codecatalyst.com/
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.	
////////////////////////////////////////////////////////////////////////////////

package com.codecatalyst.linkify.processor.pattern
{
	import org.flexunit.Assert;

	/**
	 * Unit test(s) for URL_PATTERN.
	 */
	public class UrlPatternTest extends Assert
	{
		// ========================================
		// Protected properties
		// ========================================
		
		/**
		 * RegExp instance to test.
		 */
		protected const pattern:RegExp = URL_PATTERN;
		
		// ========================================
		// Public methods
		// ========================================
		
		[Test(description="Ensure the URL_PATTERN regular expression matches the expected values.")]
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