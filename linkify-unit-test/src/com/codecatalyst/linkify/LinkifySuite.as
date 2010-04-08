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
	import com.codecatalyst.linkify.processor.*;
	import com.codecatalyst.linkify.processor.exclusion.*;
	import com.codecatalyst.linkify.processor.pattern.*;
	import com.codecatalyst.linkify.processor.transform.*;
	import com.codecatalyst.linkify.processor.transform.formatter.*;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	/**
	 * Linkify Test Suite
	 */
	public class LinkifySuite
	{
		public var linkifyTest:LinkifyTest;
		
		// processor
		
		public var patternMatchTest:PatternMatchTest;
		public var regExpTextLinkProcessor:RegExpTextLinkProcessorTest;
		
		// exclusion
		
		public var alreadyLinkedExclusionTest:AlreadyLinkedExclusionTest;
		public var differentSchemeExclusionTest:DifferentSchemeExclusionTest;
		public var partOfTagExclusionTest:PartOfTagExclusionTest;
		public var preceededByNonWhitespaceExclusionTest:PreceededByNonWhitespaceExclusionTest;
		public var requireSchemeExclusionTest:RequireSchemeExclusionTest;
		public var startsWithAtSignExclusionTest:StartsWithAtSignExclusionTest;

		// pattern
		
		public var emailAddressPatternTest:EmailAddressPatternTest;
		public var phoneNumberPatternTest:PhoneNumberPatternTest;
		public var twitterMentionPatternTest:TwitterMentionPatternTest;
		public var urlPatternTest:UrlPatternTest;
		
		// transform
		
		public var patternMatchLinkTransformTest:PatternMatchLinkTransformTest;

		// formatter
		
		public var capturedGroupFormatterTest:CapturedGroupFormatterTest;
		public var characterFilterFormatterTest:CharacterFilterFormatterTest;
	}
}