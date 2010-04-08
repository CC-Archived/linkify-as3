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
	 * Unit test(s) for CapturedGroupFormatter.
	 */
	public class CapturedGroupFormatterTest extends Assert
	{
		// ========================================
		// Public methods
		// ========================================
		
		[Test(description="Ensures format() returns correctly formatted values.")]
		public function returnsCorrectlyFormattedValue():void
		{
			var formatter:CapturedGroupFormatter = null;
			
			formatter = new CapturedGroupFormatter( "({0})");
			assertEquals( "(capture0)", formatter.format( new PatternMatch( "capture0", "capture0", 0, 8, [ "capture0" ] ) ) );
			
			formatter = new CapturedGroupFormatter( "({0})({1})");
			assertEquals( "(capture0)(capture1)", formatter.format( new PatternMatch( "capture0-capture1", "capture0-capture1", 0, 17, [ "capture0", "capture1" ] ) ) );
			
			formatter = new CapturedGroupFormatter( "({0})({1})({2})");
			assertEquals( "(capture0)(capture1)(capture2)", formatter.format( new PatternMatch( "capture0-capture1-capture2", "capture0-capture1-capture2", 0, 26, [ "capture0", "capture1", "capture2" ] ) ) );
			
			formatter = new CapturedGroupFormatter( "({2})({1})({0})");
			assertEquals( "(capture2)(capture1)(capture0)", formatter.format( new PatternMatch( "capture1-capture2-capture3", "capture0-capture1-capture2", 0, 26, [ "capture0", "capture1", "capture2" ] ) ) );
			
			formatter = new CapturedGroupFormatter( "({1})({1})({1})");
			assertEquals( "(capture1)(capture1)(capture1)", formatter.format( new PatternMatch( "capture1-capture2-capture3", "capture0-capture1-capture2", 0, 26, [ "capture0", "capture1", "capture2" ] ) ) );
		}
		
		[Test(description="Ensures format() throws an error if a specified capture index is invalid.")]
		public function throwsErrorIfCaptureIndexInvalid():void
		{
			var formatter:CapturedGroupFormatter = null;
			
			try
			{
				formatter = new CapturedGroupFormatter( "{1}");
				formatter.format( new PatternMatch( "capture0", "capture0", 0, 8, [ "capture0" ] ) );
			}
			catch ( error:Error )
			{
				assertEquals( "The specified parameter does not exist in the captured groups for this pattern match.", error.message );
			}
		}
	}
}