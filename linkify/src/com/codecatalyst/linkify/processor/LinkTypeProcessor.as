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

package com.codecatalyst.linkify.processor
{
	import flash.errors.IllegalOperationError;
	import com.codecatalyst.linkify.exclusion.ILinkPatternExclusion;
	import com.codecatalyst.linkify.core.ILinkPatternMatch;
	import com.codecatalyst.linkify.transform.ILinkPatternTransform;
	import com.codecatalyst.linkify.core.LinkPatternMatch;

	/**
	 * LinkTypeProcessor
	 * 
	 * @author John Yanarella
	 */
	public class LinkTypeProcessor implements ILinkTypeProcessor
	{
		// ========================================
		// Protected properties
		// ========================================
		
		/**
		 * The RegEx pattern associated with this ILinkType.
		 */
		protected var pattern:RegExp;
		
		[ArrayElementType("com.codecatalyst.linkify.exclusion.ILinkPatternExclusion")]
		/**
		 * The set of ILinkPatternExclusions associated with this ILinkType.
		 */
		protected var exclusions:Array;
		
		/**
		 * The ILinkPatternTransform responsible for transforming a ILinkPatternMatch into a link for this ILinkType.
		 */ 
		protected var transform:ILinkPatternTransform;
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 * 
		 * @param pattern The RegEx pattern associated with this ILinkType.
		 * @param exclusions The set of ILinkPatternExclusions associated with this ILinkType.
		 * @param transform The ILinkPatternTransform responsible for transforming a ILinkPatternMatch into a link for this ILinkType.
		 */
		public function LinkTypeProcessor( pattern:RegExp, exclusions:Array, transform:ILinkPatternTransform )
		{
			super();
			
			this.pattern = pattern;
			this.exclusions = exclusions;
			this.transform = transform;
		}

		// ========================================
		// Public methods
		// ========================================		
		
		/**
		 * @inheritDoc
		 */
		public function process( text:String, prefix:String = "event:" ):String
		{
			return text.replace( pattern, 
				
				// Process a regular expression match.
				
				function ( matchedText:String, ...rest ):String
				{
					var startIndex:int = adjustUnicodeIndex( text, rest[ rest.length - 2 ] );   // The starting index of the matched substring relative to the original string.
					var endIndex:int = startIndex + matchedText.length;                         // The ending index of the matched substring relative to the original string.
					
					var capturedGroups:Array = ( rest.length - 2 > 0 ) ? rest.slice( 0, ( rest.length - 2 ) ) : new Array();
					
					var match:ILinkPatternMatch = new LinkPatternMatch( matchedText, text, startIndex, endIndex, capturedGroups );
					
					for each ( var exclusion:ILinkPatternExclusion in exclusions )
					{
						if ( exclusion.excludeMatch( match ) )
							return matchedText;
					}
					
					return transform.createLink( match, prefix );
				}
			);
		}

		// ========================================
		// Protected methods
		// ========================================		
		
		/**
		 * Workaround for Flash Player bug where String.replace() reports the wrong matching index for Strings containing Unicode characters.  
		 * The reported index is off by 2 for each preceeding Unicode character in the string.
		 * 
		 * @param text The original matching String passed into the replacement function.
		 * @param originalIndex The original match index passed into the replacement function.
		 * 
		 * @return The corrected index. 
		 */
		protected function adjustUnicodeIndex( text:String, originalIndex:int ):int
		{
			var correctedIndex:int = originalIndex;
			
			// NOTE: The range of characters to iterate over is intentionally narrowed each time the corrected index is decremented.
			
			for ( var characterIndex:int = 0; characterIndex < correctedIndex; characterIndex++ )
			{
				// Decrement the corrected index by 2 if this character is a Unicode character.
				
				if ( text.charCodeAt( characterIndex ) > 255 )
					correctedIndex -= 2;
			}
			
			return correctedIndex;
		}
	}
}