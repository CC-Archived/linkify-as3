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

package com.codecatalyst.linkify.formatter
{
	import com.codecatalyst.linkify.core.ILinkPatternMatch;
	
	import flash.errors.IllegalOperationError;

	/**
	 * CapturedGroupFormatter
	 * 
	 * @author John Yanarella
	 */
	public class CapturedGroupFormatter implements ILinkFormatter
	{
		// ========================================
		// Protected properties
		// ========================================

		/**
		 * Format string containing substitution parameters (ex. {0}) based on ILinkPatternMatch captured groups.
		 */
		protected var formatString:String;
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 * 
		 * @param formatString Format string containing substitution parameters (ex. {0}) based on ILinkPatternMatch captured groups.
		 */
		public function CapturedGroupFormatter( formatString:String )
		{
			super();
			
			this.formatString = formatString;
		}
		
		// ========================================
		// Public methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function format( match:ILinkPatternMatch ):String
		{
			return formatString.replace( /\{(\d+)\}/g, 
				function ( ...rest ):String
				{
					var parameterIndex:int = parseInt( rest[ 1 ] );
					
					if ( parameterIndex < match.capturedGroups.length )
						return match.capturedGroups[ parameterIndex ] as String;
					
					throw new IllegalOperationError( "The specified parameter does not exist in the captured groups for this pattern match." );
				}
			);
		}
	}
}