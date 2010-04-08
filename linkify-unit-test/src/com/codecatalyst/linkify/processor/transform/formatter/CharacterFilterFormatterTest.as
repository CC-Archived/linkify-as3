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

package com.codecatalyst.linkify.processor.transform.formatter
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	/**
	 * Unit test(s) for CharacterFilterFormatter.
	 */
	public class CharacterFilterFormatterTest extends Assert
	{
		// ========================================
		// Public methods
		// ========================================
		
		[Test(description="Ensures format() returns correctly formatted values.")]
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