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
	 * Unit test(s) for RequireSchemeExclusion.
	 */
	public class RequireSchemeExclusionTest extends Assert
	{
		// ========================================
		// Protected properties
		// ========================================	
		
		/**
		 * RequireSchemeExclusion instance to test.
		 */
		protected var exclusion:RequireSchemeExclusion;

		// ========================================
		// Public methods
		// ========================================
		
		[Before]
		public function setUp():void
		{
			exclusion = new RequireSchemeExclusion( "expected://" );
		}
		
		[Test(description="Ensure excludeMatch(...) returns true if the match has the required URI scheme.")]
		public function returnsTrueIfMatchHasRequiredScheme():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "location", "location", 0, 8, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "unexpected:location", "unexpected:location", 0, 19, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "unexpected://location", "unexpected://location", 0, 21, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "expected:location", "expected:location", 0, 17, [] ) ) );
		}
		
		[Test(description="Ensure excludeMatch(...) returns false if the match does not have the required URI scheme.")]
		public function returnsFalseIfMatchDoesNotHaveRequiredScheme():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "expected://location", "expected://location", 0, 19, [] ) ) );
		}
	}
}