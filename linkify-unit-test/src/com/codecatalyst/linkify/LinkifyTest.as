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

package com.codecatalyst.linkify
{
	import org.flexunit.Assert;
	
	/**
	 * Unit test(s) for Linkify.
	 */
	public class LinkifyTest extends Assert
	{
		// ========================================
		// Public methods
		// ========================================
		
		[Test(description="Ensures Linkify.addLinks() returns expected values.")]
		public function returnsExpectedValue():void
		{
			assertEquals( "text", Linkify.addLinks( "text", null ) );
			assertEquals( "event:expected", Linkify.addLinks( "text", [ new MockTextLinkProcessor( "expected" ) ] ) );
			assertEquals( "expected", Linkify.addLinks( "text", [ new MockTextLinkProcessor( "expected" ) ], "" ) );
			assertEquals( "prefix:expected", Linkify.addLinks( "text", [ new MockTextLinkProcessor( "expected" ) ], "prefix:" ) );
			assertEquals( "prefix:expected", Linkify.addLinks( "text", [ new MockTextLinkProcessor( "expected" ), new MockTextLinkProcessor( "expected" ) ], "prefix:" ) );
		}
	}
}

import com.codecatalyst.linkify.processor.ITextLinkProcessor;

/**
 * Mock ITextLinkProcessor.
 */
class MockTextLinkProcessor implements ITextLinkProcessor
{
	// ========================================
	// Protected properties
	// ========================================
	
	/**
	 * Expected return value.
	 */
	protected var expectedValue:String;
	
	// ========================================
	// Constructor
	// ========================================
	
	/**
	 * Constructor.
	 * 
	 * @param expectedValue Expected return value.
	 */
	public function MockTextLinkProcessor( expectedValue:String )
	{
		super();
		
		this.expectedValue = expectedValue;
	}

	// ========================================
	// Public methods
	// ========================================
	
	/**
	 * Returns <code>expectedValue</code>, with <code>prefix</code> prepended, if applicable.
	 */
	public function process( text:String, prefix:String = "event:" ):String
	{
		return ( prefix != null ) ? prefix + expectedValue : expectedValue;
	}
}