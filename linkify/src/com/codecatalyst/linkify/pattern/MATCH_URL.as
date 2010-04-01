package com.codecatalyst.linkify.pattern
{
	/**
	 * 'A Liberal, Accurate Regex Pattern for Matching URLs' by John Gruber
	 * 
	 * @see http://daringfireball.net/2009/11/liberal_regex_for_matching_urls
	 * @see http://gist.github.com/249502s
	 */
	// public const MATCH_URL:RegExp = /\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/gi;
	public const MATCH_URL:RegExp = /(?xi)\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.])(?:[^\s()<>]+|\([^\s()<>]+\))+(?:\([^\s()<>]+\)|[^`!()\[\]{};:'".,<>?«»“”‘’\s]))/gi;
}