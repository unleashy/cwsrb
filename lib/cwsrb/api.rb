require 'httparty'
require 'cwsrb/errors'
require 'cwsrb/helpers'
require 'cwsrb/user'

module Cwsrb
  # This is the main class from which you use CWSrb.
  # It includes `HTTParty` with a `base_uri` of "http://conworkshop.com".
  class API
    include HTTParty
    base_uri 'http://conworkshop.com'

    # Initialize a new instance of the API object, with a mandatory custom User-Agent for HTTP requests.
    # This sets the User-Agent header for all subsequent requests, with your custom User-Agent and CWSrb's User-Agent.
    # @param user_agent [String] The User-Agent to use with HTTP requests. Please use a descriptive one.
    # @return [void] _dust_
    def initialize(user_agent)
      self.class.headers 'User-Agent' =>
                             "#{user_agent} CWSrb/#{Cwsrb::VERSION} (#{RUBY_ENGINE}/#{RUBY_VERSION}p#{RUBY_PATCHLEVEL})"
    end

    # Gets a ConWorkShop's user's info plus karma counts.
    # @param val [String, Integer] The user's name or ID.
    # @return [User] The user queried for
    # @raise [APIError] If any error ocurred while querying for that user
    def get_user(val)
      usr = Cwsrb::Helpers.resolve(val)

      # First general info
      response = self.class.get("/api?f=USER&USER=#{usr}")

      # Check if any errors occurred
      Cwsrb::Helpers.check_for_errors(response)

      response = response['out']
      attribs = {
        id: response['USER_ID'],
        name: response['USER_NAME'],
        gender: response['USER_GENDER'],
        bio: response['USER_BIO'],
        country: response['USER_COUNTRY']
      }

      # Now karma
      response = self.class.get("/api?f=USER_KARMA&USER=#{usr}")

      # Check if any errors occurred
      Cwsrb::Helpers.check_for_errors(response)

      response = response['out']
      attribs[:karma] = [response['KARMA_UP'], response['KARMA_DOWN']]

      Cwsrb::User.new(attribs)
    end
  end
end
