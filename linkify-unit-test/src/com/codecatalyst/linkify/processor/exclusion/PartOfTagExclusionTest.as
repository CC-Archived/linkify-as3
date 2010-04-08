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
	 * Unit test(s) for PartOfTagExclusion.
	 */
	public class PartOfTagExclusionTest extends Assert
	{
		// ========================================
		// Protected properties
		// ========================================	
		
		/**
		 * PartOfTagExclusion instance to test.
		 */
		protected var exclusion:PartOfTagExclusion;
		
		// ========================================
		// Public methods
		// ========================================
		
		[Before]
		public function setUp():void
		{
			exclusion = new PartOfTagExclusion();
		}
		
		[Test(description="Ensure excludeMatch(...) returns true if the match is part of a tag.")]
		public function returnsTrueIfMatchPartOfTag():void
		{
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<tag attribute=\"match\"/>", 16, 21, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<tag attribute=\"match\">value</tag>", 16, 21, [] ) ) );
			assertEquals( true, exclusion.excludeMatch( new PatternMatch( "match", "<tag><tag attribute=\"match\">value</tag></tag>", 21, 26, [] ) ) );
		}
		
		[Test(description="Ensure excludeMatch(...) returns false if the match is not part of a tag.")]
		public function returnsFalseIfMatchNotPartOfTag():void
		{
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "leftmatchright", 4, 9, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "<tag>left</tag>match", 15, 20, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "match<tag>right</tag>", 0, 5, [] ) ) );
			assertEquals( false, exclusion.excludeMatch( new PatternMatch( "match", "<tag>left</tag>match<tag>right</tag>", 15, 20, [] ) ) );
		}		
	}
}