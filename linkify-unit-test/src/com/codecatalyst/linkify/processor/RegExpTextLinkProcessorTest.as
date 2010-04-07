package com.codecatalyst.linkify.processor
{
	import org.flexunit.Assert;
	
	public class RegExpTextLinkProcessorTest extends Assert
	{
		protected const MOCK_PATTERN:RegExp = /.*/gi;
		
		[Test]
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

class MockPatternMatchExclusion implements IPatternMatchExclusion
{
	protected var exclude:Boolean;
	
	public function MockPatternMatchExclusion( exclude:Boolean )
	{
		super();
		
		this.exclude = exclude;
	}
	
	public function excludeMatch( match:IPatternMatch ):Boolean
	{
		return exclude;
	}
}

class MockPatternMatchLinkTransform implements IPatternMatchLinkTransform
{
	protected var transformedValue:String;
	
	public function MockPatternMatchLinkTransform( transformedValue:String )
	{
		super();
		
		this.transformedValue = transformedValue;
	}
	
	public function createLink( match:IPatternMatch, prefix:String = "event:" ):String
	{
		return transformedValue;
	}
}
