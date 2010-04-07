package com.codecatalyst.linkify.processor.pattern
{
	/**
	 * 'A Liberal, Accurate Regex Pattern for Matching URLs' by John Gruber
	 * 
	 * @see http://daringfireball.net/2009/11/liberal_regex_for_matching_urls
	 * @see http://gist.github.com/249502
	 */
	// public const URL_PATTERN:RegExp = /\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/gi;
	public const URL_PATTERN:RegExp = /(?xi)\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.])(?:[^\s()<>]+|\([^\s()<>]+\))+(?:\([^\s()<>]+\)|[^`!()\[\]{};:'".,<>?«»“”‘’\s]))/gi;
}