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
	/**
	 * RegExpPatternMatch
	 * 
	 * @author John Yanarella
	 */
	public class PatternMatch implements IPatternMatch
	{
		// ========================================
		// Protected properties
		// ========================================

		/**
		 * Backing variable for <code>originalText</code> property.
		 */
		protected var _originalText:String;
		
		/**
		 * Backing variable for <code>matchedText</code> property.
		 */
		protected var _matchedText:String;

		/**
		 * Backing variable for <code>capturedGroups</code> property.
		 */
		protected var _capturedGroups:Array;
		
		/**
		 * Backing variable for <code>startIndex</code> property.
		 */
		protected var _startIndex:int;

		/**
		 * Backing variable for <code>endIndex</code> property.
		 */
		protected var _endIndex:int;
		
		/**
		 * Backing variable for <code>leftText</code> property.
		 */
		protected var _leftText:String;
		
		/**
		 * Backing variable for <code>rightText</code> property.
		 */
		protected var _rightText:String;

		// ========================================
		// Public properties
		// ========================================

		/**
		 * @inheritDoc
		 */
		public function get matchedText():String
		{
			return _matchedText;
		}		
		
		/**
		 * @inheritDoc
		 */
		public function get originalText():String
		{
			return _originalText;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get startIndex():int
		{
			return _startIndex;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get endIndex():int
		{
			return _endIndex;
		}

		[ArrayElementType("String")]
		/**
		 * @inheritDoc
		 */
		public function get capturedGroups():Array
		{
			return _capturedGroups;
		}		
		
		/**
		 * @inheritDoc
		 */
		public function get leftText():String
		{
			return _leftText;
		}	
		
		/**
		 * @inheritDoc
		 */
		public function get rightText():String
		{
			return _rightText;
		}		
		
		// ========================================
		// Constructor
		// ========================================

		/**
		 * Constructor.
		 * 
		 * @param matchedText The matched substring.
		 * @param originalText The original text.
		 * @param startIndex The starting index of the matched substring relative to the original string.
		 * @param endIndex The ending index of the matched substring relative to the original string.
		 * @param capturedGroups Any captured parenthetical group matches.
		 */
		public function PatternMatch( matchedText:String, originalText:String, startIndex:int, endIndex:int, capturedGroups:Array )
		{
			super();
			
			_matchedText = matchedText;
			_originalText = originalText;
			
			_capturedGroups = capturedGroups.concat();

			_startIndex = startIndex;
			_endIndex = endIndex;
			
			_leftText = originalText.substring( 0, startIndex );
			_rightText = originalText.substring( endIndex );
		}
	}
}