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
	 * Unit test(s) for EMAIL_ADDRESS_PATTERN.
	 */
	public class EmailAddressPatternTest extends Assert
	{
		// ========================================
		// Protected properties
		// ========================================
		
		/**
		 * RegExp instance to test.
		 */
		protected const pattern:RegExp = EMAIL_ADDRESS_PATTERN;
		
		// ========================================
		// Public methods
		// ========================================

		[Test(description="Ensure the EMAIL_ADDRESS_PATTERN regular expression matches the expected values.")]
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