# Changelog

## 0.4.1
* Fixed an error with the URIs not being encoded

## 0.4.0
* Add new `Language` class and related subclasses `Type` and `Status` that are returned for calls to `API#get_lang`,
  `API#get_lang_type` and `API#get_lang_status`, respectively
* Add new `API#api_version` to get the API version returned by CWS
* Since the API now merged the functions `USER` and `USER_KARMA`, it is reflected in CWSrb correctly now
* **TODO**: documentation for the classes above

## 0.3.0
* Documented everything I could with YARD. yay! ([#2](https://github.com/unleashy/cwsrb/issues/2))
* Added `User` class that is returned for calls to `API#get_user`. ([#3](https://github.com/unleashy/cwsrb/issues/3))
* `Helpers#resolve` would return an @-prefixed string if you gave it an `Integer`. Well, no more! ([#1](https://github.com/unleashy/cwsrb/issues/1))
* Merged `API#get_karma` into `API#get_user`
* Made it so the testing console already initialized an API object for you
* Disabled metrics for rubocop

## 0.2.0
* First release on GitHub

## 0.1.0
* First actual release
