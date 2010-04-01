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

package com.codecatalyst.linkify.transform
{
	import com.codecatalyst.linkify.core.ILinkPatternMatch;

	/**
	 * ILinkPatternTransform
	 * 
	 * @author John Yanarella
	 */
	public interface ILinkPatternTransform
	{
		/**
		 * Create a link given the specified ILinkPatternMatch.
		 * 
		 * @param match The ILinkPatternMatch containing the text that should be converted into a link.
		 * @param prefix The extra prefix to prepend to the URL within the href attribute.  Typically 'event:' for use with TextField or Flex Text components.
		 * 
		 * @return The linkified text.
		 */
		function createLink( match:ILinkPatternMatch, prefix:String = "event:" ):String;
	}
}