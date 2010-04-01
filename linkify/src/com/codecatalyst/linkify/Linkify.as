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
	import com.codecatalyst.linkify.processor.ILinkTypeProcessor;

	/**
	 * Linkify
	 * 
	 * @author John Yanarella
	 */
	public class Linkify
	{
		/**
		 * Converts all occurrences of the specified link types in the specified text into clickable links.
		 * 
		 * @param text The text to linkify.
		 * @param linkTypeProcessors The ILinkTypeProcessors to use to process the text.
		 * @param prefix The extra prefix to prepend to the URL within the href attribute.  Typically 'event:' for use with TextField or Flex Text components.
		 * 
		 * @return The linkified text.
		 * 
		 * @see LinkTypes
		 */
		public static function addLinks( text:String, linkTypeProcessors:Array, prefix:String = "event:" ):String
		{
			for each ( var linkTypeProcessor:ILinkTypeProcessor in linkTypeProcessors )
			{
				text = linkTypeProcessor.process( text, prefix );
			}
			
			return text;
		}
	}
}