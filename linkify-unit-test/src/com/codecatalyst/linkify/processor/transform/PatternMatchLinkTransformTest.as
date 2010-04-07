package com.codecatalyst.linkify.processor.transform
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	public class PatternMatchLinkTransformTest extends Assert
	{
		[Test]
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

class MockPatternMatchFormatter implements IPatternMatchFormatter
{
	protected var expectedValue:String;
	
	public function MockPatternMatchFormatter( expectedValue:String ):void
	{
		super();
		
		this.expectedValue = expectedValue;
	}
	
	public function format( match:IPatternMatch ):String
	{
		return expectedValue;
	}
}