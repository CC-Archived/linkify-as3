package com.codecatalyst.linkify
{
	import com.codecatalyst.linkify.processor.*;
	import com.codecatalyst.linkify.processor.exclusion.*;
	import com.codecatalyst.linkify.processor.pattern.*;
	import com.codecatalyst.linkify.processor.transform.*;
	import com.codecatalyst.linkify.processor.transform.formatter.*;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
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