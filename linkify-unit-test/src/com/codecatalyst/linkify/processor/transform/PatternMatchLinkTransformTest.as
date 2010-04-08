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

package com.codecatalyst.linkify.processor.transform
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	/**
	 * Unit test(s) for PatternMatchLink.
	 */
	public class PatternMatchLinkTransformTest extends Assert
	{
		// ========================================
		// Public methods
		// ========================================
		
		[Test(description="Ensures createLink() returns correctly transformed values.")]
		public function returnsCorrectlyTransformedValue():void
		{
			var transform:PatternMatchLinkTransform;
			
			transform = new PatternMatchLinkTransform();
			assertEquals( "<a href=\"event:match\">match</a>", transform.createLink( new PatternMatch( "match", "match", 0, 5, [] ) ) );

			transform = new PatternMatchLinkTransform();
			assertEquals( "<a href=\"match\">match</a>", transform.createLink( new PatternMatch( "match", "match", 0, 5, [] ), "" ) );

			transform = new PatternMatchLinkTransform();
			assertEquals( "<a href=\"match\">match</a>", transform.createLink( new PatternMatch( "match", "match", 0, 5, [] ), null ) );

			transform = new PatternMatchLinkTransform( "scheme:" );
			assertEquals( "<a href=\"event:scheme:match\">match</a>", transform.createLink( new PatternMatch( "match", "match", 0, 5, [] ) ) );
				
			transform = new PatternMatchLinkTransform( "scheme:" );
			assertEquals( "<a href=\"event:scheme:match\">scheme:match</a>", transform.createLink( new PatternMatch( "scheme:match", "scheme:match", 0, 12, [] ) ) );

			transform = new PatternMatchLinkTransform( "scheme:" );
			assertEquals( "<a href=\"event:other:match\">other:match</a>", transform.createLink( new PatternMatch( "other:match", "other:match", 0, 11, [] ) ) );
			
			transform = new PatternMatchLinkTransform( "scheme://" );
			assertEquals( "<a href=\"event:scheme://match\">match</a>", transform.createLink( new PatternMatch( "match", "match", 0, 5, [] ) ) );

			transform = new PatternMatchLinkTransform( "scheme://" );
			assertEquals( "<a href=\"event:scheme://match\">scheme://match</a>", transform.createLink( new PatternMatch( "scheme://match", "scheme://match", 0, 14, [] ) ) );

			transform = new PatternMatchLinkTransform( "scheme://" );
			assertEquals( "<a href=\"event:other://match\">other://match</a>", transform.createLink( new PatternMatch( "other://match", "other://match", 0, 13, [] ) ) );

			transform = new PatternMatchLinkTransform( "scheme://", new MockPatternMatchFormatter( "hyperlink" ), new MockPatternMatchFormatter( "label" ) );
			assertEquals( "<a href=\"event:hyperlink\">label</a>", transform.createLink( new PatternMatch( "scheme://match", "scheme://match", 0, 14, [] ) ) );				

			transform = new PatternMatchLinkTransform( "scheme://", new MockPatternMatchFormatter( "hyperlink" ), new MockPatternMatchFormatter( "label" ) );
			assertEquals( "<a href=\"event:scheme://hyperlink\">label</a>", transform.createLink( new PatternMatch( "match", "match", 0, 14, [] ) ) );		
		}
	}
}

import com.codecatalyst.linkify.processor.IPatternMatch;
import com.codecatalyst.linkify.processor.transform.formatter.IPatternMatchFormatter;

/**
 * Mock IPatternMatchFormatter.
 */
class MockPatternMatchFormatter implements IPatternMatchFormatter
{
	// ========================================
	// Protected properties
	// ========================================
	
	/**
	 * Expected return value for <code>format(...)</code>.
	 */
	protected var expectedValue:String;
	
	// ========================================
	// Constructor
	// ========================================	
	
	/**
	 * Constructor.
	 * 
	 * @param expectedValue Expected return value for <code>format(...)</code>.
	 */
	public function MockPatternMatchFormatter( expectedValue:String ):void
	{
		super();
		
		this.expectedValue = expectedValue;
	}
	
	// ========================================
	// Protected properties
	// ========================================	
	
	/**
	 * Returns <code>expectedValue</code>.
	 */
	public function format( match:IPatternMatch ):String
	{
		return expectedValue;
	}
}