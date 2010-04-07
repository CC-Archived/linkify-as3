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

package com.codecatalyst.linkify.processor.transform
{
	import com.codecatalyst.linkify.processor.IPatternMatch;
	import com.codecatalyst.linkify.processor.transform.formatter.IPatternMatchFormatter;

	/**
	 * PatternMatchLinkTransform
	 * 
	 * @author John Yanarella
	 */
	public class PatternMatchLinkTransform implements IPatternMatchLinkTransform
	{
		// ========================================
		// Protected properties
		// ========================================
		
		/**
		 * URI Scheme
		 */
		protected var scheme:String;
		
		/**
		 * IPatternMatchFormatter to apply to the matched text when creating the text to display for a link.
		 */
		protected var hyperlinkReferenceFormatter:IPatternMatchFormatter;
		
		/**
		 * IPatternMatchFormatter to apply to the matched text when creating the hyperlink reference (aka 'href') for a link.
		 */
		protected var hyperlinkTextFormatter:IPatternMatchFormatter;
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 * 
		 * @param scheme URI Scheme
		 * @param hyperlinkReferenceFormatter IPatternMatchFormatter to apply to the matched text when creating the text to display for a link.
		 * @param hyperlinkTextFormatter IPatternMatchFormatter to apply to the matched text when creating the hyperlink reference (aka 'href') for a link.
		 */
		public function PatternMatchLinkTransform( scheme:String = null, hyperlinkReferenceFormatter:IPatternMatchFormatter = null, hyperlinkTextFormatter:IPatternMatchFormatter = null )
		{
			super();
			
			this.scheme = scheme;
			
			this.hyperlinkReferenceFormatter = hyperlinkReferenceFormatter;
			this.hyperlinkTextFormatter = hyperlinkTextFormatter;
		}
		
		// ========================================
		// Public methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function createLink( match:IPatternMatch, prefix:String = "event:" ):String
		{
			return "<a href=\"" + createHyperlinkReference( match, prefix ) + "\">" + createHyperlinkText( match ) + "</a>";
		}

		// ========================================
		// Protected methods
		// ========================================

		/**
		 * Create the hyperlink reference (aka 'href') given the specified IPatternMatchFormatter.
		 * 
		 * @param match The IPatternMatchFormatter containing the matched text.
		 * @param prefix The extra prefix to prepend to the URL within the href attribute.  Typically 'event:' for use with TextField or Flex Text components.
		 * 
		 * @return The resultant hyperlink reference.
		 */
		protected function createHyperlinkReference( match:IPatternMatch, prefix:String = "event:" ):String
		{
			var href:String = "";
			
			// Append the prefix, if applicable.
			
			if ( prefix != null )
				href += prefix;
			
			// Append the scheme, if it is not already present and there are no other schemes already present.
			
			if ( ( scheme != null ) && ( match.matchedText.indexOf( scheme ) != 0 ) && ( match.matchedText.match( /^[a-z\-]+:\/?\/?/i ) == null ) )
				href += scheme;
			
			// Append and format (if applicable) the hyperlink reference.
			
			if ( hyperlinkReferenceFormatter != null )
				href += hyperlinkReferenceFormatter.format( match );
			else
				href += match.matchedText;
			
			return href;
		}
		
		/**
		 * Create the hyperlink display text given the specified IPatternMatchFormatter.
		 * 
		 * @param match The IPatternMatchFormatter containing the matched text.
		 * 
		 * @return The resultant hyperlink text.
		 */
		protected function createHyperlinkText( match:IPatternMatch ):String
		{
			var text:String = "";
			
			// Append and format (if applicable) the hyperlink text.
			
			if ( hyperlinkTextFormatter != null )
				text += hyperlinkTextFormatter.format( match );
			else
				text += match.matchedText;
			
			return text;
		}
	}
}