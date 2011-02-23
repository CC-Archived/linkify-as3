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

	/**
	 * LinkTypes
	 * 
	 * @author John Yanarella
	 */
	public class LinkTypes
	{
		// ========================================
		// Public constants
		// ========================================
		
		/**
		 * URL.
		 */
		public static var URL:ITextLinkProcessor = 
			new RegExpTextLinkProcessor( 
				URL_PATTERN, 
				[ new StartsWithAtSignExclusion(), new PartOfTagExclusion(), new AlreadyLinkedExclusion() ], 
				new PatternMatchLinkTransform( "http://" ) 
			);
		
		/**
		 * E-mail address.
		 */
		public static var EMAIL_ADDRESS:ITextLinkProcessor = 
			new RegExpTextLinkProcessor( 
				EMAIL_ADDRESS_PATTERN, 
				[ new PartOfTagExclusion(), new AlreadyLinkedExclusion() ], 
				new PatternMatchLinkTransform( "mailto:" ) 
			);
		
		/**
		 * Phone number.
		 */
		public static var PHONE_NUMBER:ITextLinkProcessor = 
			new RegExpTextLinkProcessor(
				PHONE_NUMBER_PATTERN,
				[ new PartOfTagExclusion(), new AlreadyLinkedExclusion() ],
				new PatternMatchLinkTransform( 
					"callto:", 
					new CharacterFilterFormatter( "+0-9" ), 
					new CapturedGroupFormatter( "{0} {1} {2}-{3}" )
				)
			);
		
		/**
		 * Twitter mention.
		 */
		public static var TWITTER_MENTION:ITextLinkProcessor =
			new RegExpTextLinkProcessor(
				TWITTER_MENTION_PATTERN,
				[ new PreceededByNonWhitespaceExclusion(), new PartOfTagExclusion(), new AlreadyLinkedExclusion() ],
				new PatternMatchLinkTransform(
					null,
					new CapturedGroupFormatter( "http://twitter.com/{0}" )
				)
			);
		
		/**
		 * FedEx tracking number.
		 */
		public static var FEDEX_TRACKING_NUMBER:ITextLinkProcessor =
			new RegExpTextLinkProcessor(
				FEDEX_TRACKING_NUMBER_PATTERN,
				[ new PartOfTagExclusion(), new AlreadyLinkedExclusion() ],
				new PatternMatchLinkTransform(
					null,
					new CapturedGroupFormatter( "http://www.fedex.com/cgi-bin/tracking?action=track&language=english&cntry_code=us&initial=x&tracknumbers={0}" )
				)
			);
		
		/**
		 * UPS tracking number.
		 */
		public static var UPS_TRACKING_NUMBER:ITextLinkProcessor =
			new RegExpTextLinkProcessor(
				UPS_TRACKING_NUMBER_PATTERN,
				[ new PartOfTagExclusion(), new AlreadyLinkedExclusion() ],
				new PatternMatchLinkTransform(
					null,
					new CapturedGroupFormatter( "http://wwwapps.ups.com/WebTracking/processRequest?AgreeToTermsAndConditions=yes&loc=en_US&tracknum={0}" )
				)
			);
		
		/**
		 * USPS tracking number.
		 */
		public static var USPS_TRACKING_NUMBER:ITextLinkProcessor =
			new RegExpTextLinkProcessor(
				USPS_TRACKING_NUMBER_PATTERN,
				[ new PartOfTagExclusion(), new AlreadyLinkedExclusion() ],
				new PatternMatchLinkTransform(
					null,
					new CapturedGroupFormatter( "http://trkcnfrm1.smi.usps.com/PTSInternetWeb/InterLabelInquiry.do?origTrackNum={0}" )
				)
			);
	}
}