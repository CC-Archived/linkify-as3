# Linkify for ActionScript 3.0

Linkify is an ActionScript 3.0 library that simplifies the task of identifying patterns in plain text (URLs, e-mail addresses, phone numbers, twitter mentions, etc.) and converting them into clickable links.

The included ActionScript 3.0 functions are suitable for use in Flash, pure ActionScript or Flex projects.  

Linkify also includes custom UI components which extend standard Flex 3 'halo' components to provide missing hyperlink styling capabilities analogous to those found in HTML, including custom colors and text-decoration for links in normal, hover and active states.

## Regular Expressions

Linkify leverages regular expressions borrowed from the following open source projects:

* John Gruber's ['A Liberal, Accurate Regex Pattern for Matching URLs'](http://daringfireball.net/2009/11/liberal_regex_for_matching_urls) and subsequent [updates](http://gist.github.com/249502s) (public domain).

* Ruby on Rails' [TextHelper](http://github.com/rails/rails/blob/master/actionpack/lib/action_view/helpers/text_helper.rb)'s e-mail address matching regex pattern (MIT license).
