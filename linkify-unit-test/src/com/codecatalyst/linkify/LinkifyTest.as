package com.codecatalyst.linkify
{
	import org.flexunit.Assert;
	
	public class LinkifyTest extends Assert
	{
		[Test]
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

class MockTextLinkProcessor implements ITextLinkProcessor
{
	protected var expectedValue:String;
	
	public function MockTextLinkProcessor( expectedValue:String )
	{
		super();
		
		this.expectedValue = expectedValue;
	}
	
	public function process( text:String, prefix:String = "event:" ):String
	{
		return ( prefix != null ) ? prefix + expectedValue : expectedValue;
	}
}