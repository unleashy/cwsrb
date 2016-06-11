module Cwsrb
  module Helpers
    module_function

    def resolve(val)
      # Determine if val is an ID or username.
      (val =~ /\A(S?\d+)\z/) ? val
      : "@#{val}"
    end
  end
end