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

package com.codecatalyst.linkify.processor
{
	import org.flexunit.Assert;
	
	/**
	 * Unit tests for RegExpTextLinkProcessor.
	 */
	public class RegExpTextLinkProcessorTest extends Assert
	{
		// ========================================
		// Protected properties
		// ========================================
		
		/**
		 * Mock regular expression - matches anything.
		 */
		protected const MOCK_PATTERN:RegExp = /.*/gi;

		// ========================================
		// Public methods
		// ========================================
		
		[Test(description="Ensures process() returns correctly processed values.")]
		public function returnsCorrectlyProcessedValue():void
		{
			var processor:RegExpTextLinkProcessor = null;
			
			processor = new RegExpTextLinkProcessor( MOCK_PATTERN, null, new MockPatternMatchLinkTransform( "expected" ) );
			assertEquals( "expected", processor.process( "input" ) );

			processor = new RegExpTextLinkProcessor( MOCK_PATTERN, [], new MockPatternMatchLinkTransform( "expected" ) );
			assertEquals( "expected", processor.process( "input" ) );
			
			processor = new RegExpTextLinkProcessor( MOCK_PATTERN, [ new MockPatternMatchExclusion( false ) ], new MockPatternMatchLinkTransform( "expected" ) );
			assertEquals( "expected", processor.process( "input" ) );

			processor = new RegExpTextLinkProcessor( MOCK_PATTERN, [ new MockPatternMatchExclusion( true ) ], new MockPatternMatchLinkTransform( "unexpected" ) );
			assertEquals( "input", processor.process( "input" ) );

			processor = new RegExpTextLinkProcessor( MOCK_PATTERN, [ new MockPatternMatchExclusion( false ), new MockPatternMatchExclusion( false ) ], new MockPatternMatchLinkTransform( "expected" ) );
			assertEquals( "expected", processor.process( "input" ) );

			processor = new RegExpTextLinkProcessor( MOCK_PATTERN, [ new MockPatternMatchExclusion( false ), new MockPatternMatchExclusion( true ) ], new MockPatternMatchLinkTransform( "unexpected" ) );
			assertEquals( "input", processor.process( "input" ) );
		}
	}
}

import com.codecatalyst.linkify.processor.IPatternMatch;
import com.codecatalyst.linkify.processor.exclusion.IPatternMatchExclusion;
import com.codecatalyst.linkify.processor.transform.IPatternMatchLinkTransform;

/**
 * Mock IPatternMatchExclusion.
 */
class MockPatternMatchExclusion implements IPatternMatchExclusion
{
	// ========================================
	// Protected properties
	// ========================================
	
	/**
	 * Expected return value for <code>excludeMatch(...)</code>.
	 */
	protected var exclude:Boolean;
	
	// ========================================
	// Constructor
	// ========================================

	/**
	 * Constructor.
	 * 
	 * @param exclude Expected return value for <code>excludeMatch(...)</code>.
	 */
	public function MockPatternMatchExclusion( exclude:Boolean )
	{
		super();
		
		this.exclude = exclude;
	}

	// ========================================
	// Protected properties
	// ========================================
	
	/**
	 * Returns <code>exclude</code>.
	 */
	public function excludeMatch( match:IPatternMatch ):Boolean
	{
		return exclude;
	}
}

/**
 * Mock IPatternMatchLinkTransform
 */
class MockPatternMatchLinkTransform implements IPatternMatchLinkTransform
{
	// ========================================
	// Protected properties
	// ========================================

	/**
	 * Expected return value for <code>createLink(...)</code>.
	 */
	protected var transformedValue:String;

	// ========================================
	// Constructor
	// ========================================	
	
	/**
	 * Constructor.
	 * 
	 * @param transformedValue Expected return value for <code>createLink(...)</code>.
	 */
	public function MockPatternMatchLinkTransform( transformedValue:String )
	{
		super();
		
		this.transformedValue = transformedValue;
	}
	
	// ========================================
	// Protected properties
	// ========================================	

	/**
	 * Returns <code>transformedValue</code>.
	 */
	public function createLink( match:IPatternMatch, prefix:String = "event:" ):String
	{
		return transformedValue;
	}
}
