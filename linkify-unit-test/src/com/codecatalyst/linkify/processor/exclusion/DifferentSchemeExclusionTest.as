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

package com.codecatalyst.linkify.processor.exclusion
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	/**
	 * Unit test(s) for DifferentSchemeExclusion.
	 */
	public class DifferentSchemeExclusionTest extends Assert
	{
		// ========================================
		// Protected properties
		// ========================================	
		
		/**
		 * DifferentSchemeExclusion instance to test.
		 */
		protected var exclusion:DifferentSchemeExclusion;
		
		// ========================================
		// Public methods
		// ========================================
		
		[Before]
		public function setUp():void
		{
			exclusion = new DifferentSchemeExclusion( "expectedScheme://" );
		}
		
		[Test(description="Ensure excludeMatch(...) returns true if the match has a different scheme.")]
		public function returnsTrueIfMatchHasDifferentScheme():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "unexpectedScheme:location", "unexpectedScheme:location", 0, 25, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "unexpectedScheme://location", "unexpectedScheme://location", 0, 27, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "expectedScheme:location", "expectedScheme:location", 0, 23, [] ) ) );
		}
		
		[Test(description="Ensure excludeMatch(...) returns false if the match has the expected scheme.")]
		public function returnsFalseMatchHasExpectedScheme():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "location", "location", 0, 8, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "location?unexpectedScheme://", "location?unexpectedScheme://", 0, 28, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "expectedScheme://location", "expectedScheme://location", 0, 25, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "expectedScheme://location?expectedScheme://", "expectedScheme://location?expectedScheme://", 0, 43, [] ) ) );
		}
	}
}