package com.codecatalyst.linkify.processor.transform.formatter
{
	import com.codecatalyst.linkify.processor.PatternMatch;
	
	import org.flexunit.Assert;
	
	public class CapturedGroupFormatterTest extends Assert
	{
		[Test]
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
		
		[Test]
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