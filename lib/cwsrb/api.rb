require 'httparty'
require 'cwsrb/errors'
require 'cwsrb/helpers'

module Cwsrb
  class API
    include HTTParty
    base_uri 'http://conworkshop.com'

    def initialize(user_agent)
      self.class.headers 'User-Agent' =>
                             "#{user_agent} CWSrb/#{Cwsrb::VERSION} (#{RUBY_ENGINE}/#{RUBY_VERSION}p#{RUBY_PATCHLEVEL})"
    end

    def get_karma(val)
      # Determine if val is an ID or username.
      usr = Cwsrb::Helpers.resolve(val)
      response = self.class.get("/api?f=USER_KARMA&USER=#{usr}")

      # Check if any errors occurred
      if response['err_idx'] > 0
        raise Cwsrb::APIError, response['err_msg']
      else
        response['out']
      end
    end

    def get_user(val)
      usr = Cwsrb::Helpers.resolve(val)
      response = self.class.get("/api?f=USER&USER=#{usr}")

      if response['err_idx'] > 0
        raise Cwsrb::APIError, response['err_msg']
      else
        response['out']
      end
    end
  end
end
