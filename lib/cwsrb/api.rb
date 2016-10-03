require 'httparty'
require 'cwsrb/errors'
require 'cwsrb/helpers'
require 'cwsrb/data'

module Cwsrb
  # This is the main class from which you use CWSrb.
  # It includes `HTTParty` with a `base_uri` of "http://conworkshop.com".
  class API
    include HTTParty
    base_uri 'conworkshop.com'

    # Initialize a new instance of the API object, with a mandatory custom User-Agent for HTTP requests.
    # This sets the User-Agent header for all subsequent requests, with your custom User-Agent and CWSrb's User-Agent.
    # @param user_agent [String] The User-Agent to use with HTTP requests. Please use a descriptive one.
    # @return [API] a new instance of `API`
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
      response = self.class.get("/api/USER/#{usr}")

      # Check if any errors occurred
      Cwsrb::Helpers.check_for_errors(response)

      response = response['out']
      attribs = {
        id: response['USER_ID'],
        name: response['USER_NAME'],
        gender: response['USER_GENDER'],
        bio: response['USER_BIO'],
        country: response['USER_COUNTRY'],
        karma: response['KARMA']
      }

      Cwsrb::User.new(attribs)
    end

    def get_lang(val)
      response = self.class.get("/api/LANG/#{val}")

      Cwsrb::Helpers.check_for_errors(response)

      response = response['out']
      attribs = {
        code: response['CODE'],
        name: response['NAME'],
        native_name: response['NATIVE_NAME'],
        ipa: response['IPA'],
        type: get_lang_type(response['TYPE']),
        owners: response['OWNERS'],
        overview: response['OVERVIEW'],
        public: response['PUBLIC'],
        status: get_lang_status(response['STATUS']),
        registered: Time.at(response['REGISTERED']),
        word_count: response['WORD_COUNT']
      }

      Cwsrb::Language.new(attribs)
    end

    def get_lang_type(val)
      response = self.class.get("/api/LANG/TYPE/#{val}")

      Cwsrb::Helpers.check_for_errors(response)

      response = response['out']
      attribs = {
        code: response['TYPE'].upcase,
        desc: response['DESC']
      }

      Cwsrb::Language::Type.new(attribs)
    end

    def get_lang_status(val)
      response = self.class.get("/api/LANG/STATUS/#{val}")

      Cwsrb::Helpers.check_for_errors(response)

      response = response['out']
      attribs = {
        code: response['STATUS'].upcase,
        desc: response['DESC']
      }

      Cwsrb::Language::Status.new(attribs)
    end

    def api_version
      self.class.get('/api')['api_ver']
    end
  end
end
