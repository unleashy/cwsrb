module Cwsrb
  # @abstract This class subclasses `RuntimeError` and serves as a base
  #   for all other CWSrb's error classes.
  Error = Class.new(RuntimeError)

  # Raised when a general API error occurs.
  APIError = Class.new(Error)
end
