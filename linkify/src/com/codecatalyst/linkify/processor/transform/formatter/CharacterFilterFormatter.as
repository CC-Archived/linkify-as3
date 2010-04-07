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

package com.codecatalyst.linkify.processor.transform.formatter
{
	import com.codecatalyst.linkify.processor.IPatternMatch;

	/**
	 * CharacterFilterFormatter
	 * 
	 * @author John Yanarella
	 */
	public class CharacterFilterFormatter implements IPatternMatchFormatter
	{
		// ========================================
		// Protected properties
		// ========================================

		/**
		 * Allowed characters.
		 */
		protected var allowedCharacters:String;
		
		/**
		 * Indicates whether character restrictions should be case-insensitive.
		 * 
		 * @see #allowedCharacters
		 */
		protected var caseInsensitive:Boolean;
		
		/**
		 * RegExp pattern used to identify invalid characters.
		 * 
		 * @see #populateInvalidCharactersPattern()
		 */
		protected var invalidCharactersPattern:RegExp;
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 * 
		 * @param allowedCharacters Allowed characters.
		 * @param caseInsensitive Indicates whether character restrictions should be case-insensitive.
		 */
		public function CharacterFilterFormatter( allowedCharacters:String, caseInsensitive:Boolean = true )
		{
			super();
			
			this.allowedCharacters = allowedCharacters;
			this.caseInsensitive = caseInsensitive;
			
			populateInvalidCharactersPattern();
		}

		// ========================================
		// Public methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function format( match:IPatternMatch ):String
		{
			return match.matchedText.replace( invalidCharactersPattern, "" );
		}
		
		// ========================================
		// Protected methods
		// ========================================
		
		/**
		 * Populates <code>invalidCharactersPattern</code> with a RegExp that can be used to identify any characters other
		 * than <code>allowedCharacters</code>, with case sensitivity determined by the <code>caseInsensitive</code> property.
		 */
		protected function populateInvalidCharactersPattern():void
		{
			// Escape all characters that have special meaning in a regular expression character set, except '-'.
			
			var escapedAllowedCharacters:String = allowedCharacters.replace( /([\\\/\|()\[\]\^\$\&\.\*\?\+])/g, "\\$1" );
			
			// Create a new regular expression character set pattern describing any character not in the specified allowed character set.
			
			var pattern:String = "[^" + escapedAllowedCharacters + "]+";
			
			// Create a regular expression from the pattern.
			
			invalidCharactersPattern = new RegExp( pattern, caseInsensitive ? "gi" : "g" );
		}
	}
}