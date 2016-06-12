module Cwsrb
  # This module has a bunch of utility functions for use in other files.
  # All methods are marked as `module_function` so you can do things like `Helpers.resolve`.
  module Helpers
    module_function

    # Determine if val is an ID or username.
    # ID is a bunch of numbers that can or cannot be followed by an 'S'.
    # Username... is not an ID.
    # @param val [String, Integer] The value to discriminate
    # @return [String, Integer] Either an '@'-prefixed `val` if it's an username or val itself if it isn't
    def resolve(val)
      return val if val.is_a?(Integer)
      (val =~ /\A(S?\d+)\z/) ? val : "@#{val}"
    end

    # Verifies if the response has any errors, and if so, raises a `APIError`.
    # @param response [Hash<String, String>] the response hash to check for errors
    # @raise [APIError] if any errors are detected in the response
    # @return [void]
    def check_for_errors(response)
      raise Cwsrb::APIError, response['err_msg'] if response['err_idx'] > 0
    end
  end
end
