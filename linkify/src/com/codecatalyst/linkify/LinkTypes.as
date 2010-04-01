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
	import com.codecatalyst.linkify.exclusion.*;
	import com.codecatalyst.linkify.formatter.*;
	import com.codecatalyst.linkify.pattern.*;
	import com.codecatalyst.linkify.processor.*;
	import com.codecatalyst.linkify.transform.*;

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
		public static var URL:ILinkTypeProcessor = 
			new LinkTypeProcessor( 
				MATCH_URL, 
				[ new StartsWithAtSignExclusion(), new InsideTagExclusion(), new AlreadyLinkedExclusion() ], 
				new LinkPatternTransform( "http://" ) 
			);
		
		/**
		 * E-mail address.
		 */
		public static var EMAIL_ADDRESS:ILinkTypeProcessor = 
			new LinkTypeProcessor( 
				MATCH_EMAIL_ADDRESS, 
				[ new InsideTagExclusion(), new AlreadyLinkedExclusion() ], 
				new LinkPatternTransform( "mailto:" ) 
			);
		
		/**
		 * Phone number.
		 */
		public static var PHONE_NUMBER:ILinkTypeProcessor = 
			new LinkTypeProcessor(
				MATCH_PHONE_NUMBER,
				[ new InsideTagExclusion(), new AlreadyLinkedExclusion() ],
				new LinkPatternTransform( 
					"callto:", 
					new CharacterFilterFormatter( "+0-9" ), 
					new CapturedGroupFormatter( "{0} {1} {2}-{3}" )
				)
			);
		
		/**
		 * Twitter mention.
		 */
		public static var TWITTER_MENTION:ILinkTypeProcessor =
			new LinkTypeProcessor(
				MATCH_TWITTER_MENTION,
				[ new PreceededByNonWhitespaceExclusion(), new InsideTagExclusion(), new AlreadyLinkedExclusion() ],
				new LinkPatternTransform(
					null,
					new CapturedGroupFormatter( "http://twitter.com/{0}" )
				)
			);
	}
}