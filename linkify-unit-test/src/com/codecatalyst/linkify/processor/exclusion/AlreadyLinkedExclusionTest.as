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
	 * Unit test(s) for AlreadyLinkedExclusion.
	 */
	public class AlreadyLinkedExclusionTest extends Assert
	{
		// ========================================
		// Protected properties
		// ========================================		

		/**
		 * AlreadyLinkedExclusion instance to test.
		 */
		protected var exclusion:AlreadyLinkedExclusion;

		// ========================================
		// Public methods
		// ========================================		
		
		[Before]
		public function setUp():void
		{
			exclusion = new AlreadyLinkedExclusion();
		}

		[Test(description="Ensure excludeMatch(...) returns true if the match is already linked.")]
		public function returnsTrueIfAlreadyLinked():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">match</a>", 14, 19, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\" target=\"blank\">match</a>", 29, 34, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">leftmatchright</a>", 18, 23, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">left</a><a href=\"url\">match</a><a>right</a>", 36, 41, [] ) ) );
		}
		
		[Test(description="Ensure excludeMatch(...) returns false if the match is not already linked.")]
		public function returnsFalseIfNotAlreadyLinked():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "leftmatchright", 4, 9, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">left</a>match", 22, 27, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match<a href=\"url\">right</a>", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "<a href=\"url\">left</a>match<a href=\"url\">right</a>", 22, 27, [] ) ) );
		}
	}
}