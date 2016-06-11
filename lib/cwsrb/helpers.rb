module Cwsrb
  module Helpers
    module_function

    def resolve(val)
      # Determine if val is an ID or username.
      # ID is a bunch of numbers that can or cannot be followed by an 'S'.
      # Username... is not an ID.
      (val =~ /\A(S?\d+)\z/) ? val : "@#{val}"
    end

    def check_for_errors(response)
      raise Cwsrb::APIError, response['err_msg'] if response['err_idx'] > 0
    end
  end
end
