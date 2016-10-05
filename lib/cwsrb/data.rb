module Cwsrb
  CWS_BASE = 'http://conworkshop.com'

  # The User class represents a member of ConWorkShop.
  class User
    # @return [String, Integer] The User's ID
    attr_reader :id

    # @return [String] The User's name
    attr_reader :name

    # @return [String] The User's gender, one of "Male", "Female", "Cyborg"
    #   or "Other"
    attr_reader :gender

    # @return [String] The User's bio, max 1000 characters
    attr_reader :bio

    # @return [String] The User's country
    attr_reader :country

    # @return [Array<(Integer, Integer)>] The User's karma counts; first one
    #   is upvotes and second one is downvotes
    attr_reader :karma

    # Initializes a new User instance with an options hash.
    # @param id [String, Integer] The user's ID: a bunch of numbers that may
    #   or may not be prefixed with 'S'. Defaults to an empty string.
    # @param name [String] The user's name. Defaults to an empty string.
    # @param gender [String] The user's gender, one of "Male", "Female",
    #   "Cyborg" or "Other". Defaults to "Other".
    # @param bio [String] The user's bio or about section. Defaults to an
    #   empty string.
    # @param country [String] The user's country. Defaults to "Unknown".
    # @param karma [Array<(Integer, Integer)>] The user's karma counts.
    #   First is upvotes, second is downvotes. Defaults to zero for both.
    # @return [User] a new instance of User
    def initialize(id: '', name: '', gender: 'Other', bio: '', country: 'Unknown', karma: [0, 0])
      @id = id
      @name = name
      @gender = gender
      @bio = bio
      @country = country
      @karma = karma
    end

    # Generates a CWS link to this user.
    # @return [String] The generated link.
    def generate_link
      CWS_BASE + "/view_profile.php?m=#{@id}"
    end

    # @overload inspect
    #   @return [String] A more meaningful output than that of the default
    #   inspect method, with all of User's attributes.
    def inspect
      "<User id=#{@id} name=#{@name} gender=#{gender} bio=#{bio} country=#{country} karma=#{karma}>"
    end
  end

  # The Language class represents a language of ConWorkShop.
  class Language
    # The Type class represents a language type of ConWorkShop.
    class Type
      # @return [String] The three-character type code.
      attr_reader :code

      # @return [String] The description for the type.
      attr_reader :desc

      # Initializes a new Type instance with an options hash.
      # @param code [String] The three-character type code. Defaults to an
      #   empty string.
      # @param desc [String] The description for the type. Defaults to an
      #   empty string.
      # @return [Type] A new instance of Type.
      def initialize(code: '', desc: '')
        @code = code
        @desc = desc
      end

      # @overload inspect
      #   @return [String] A more meaningful output than that of the default
      #   inspect method, with all of Type's attributes.
      def inspect
        "<Language::Type code=#{@code} desc=#{@desc}>"
      end
    end

    # The Language::Type class represents a language status of ConWorkShop.
    class Status
      # @return [String] The one-character status code.
      attr_reader :code

      # @return [String] The description for the status.
      attr_reader :desc

      # Initializes a new Status instance with an options hash.
      # @param code [String] The one-character status code. Defaults to an
      #   empty string.
      # @param desc [String] The description for the status. Defaults to an
      #   empty string.
      def initialize(code: '', desc: '')
        @code = code
        @desc = desc
      end

      # @overload inspect
      #   @return [String] A more meaningful output than that of the default
      #   inspect method, with all of Status' attributes.
      def inspect
        "<Language::Status code=#{@code} desc=#{@desc}>"
      end
    end

    # @return [String] The three-character language code.
    attr_reader :code

    # @return [String] The language's name.
    attr_reader :name

    # @return [String] The language's autonym (native name).
    attr_reader :native_name

    # @return [String] The IPA transcription for the language's {@link native_name}
    attr_reader :ipa

    # @return [Language::Type] The language's type.
    attr_reader :type

    # @return [Array<String>] The owner plus shared users of this language.
    #   The first element is the original owner.
    attr_reader :owners

    # @return [String] The overview, about section or bio, of this language.
    attr_reader :overview

    # @return [Boolean] Whether or not this language's _dictionary_ is public.
    attr_reader :public

    # @return [Language::Status] The language's status.
    attr_reader :status

    # @return [Time] The time at which the language was registered.
    attr_reader :registered

    # @return [Integer] The word count for this language.
    attr_reader :word_count

    # @return [Array<(Integer, Integer)>] The language's karma counts;
    #   first one is upvotes and second one is downvotes.
    attr_reader :karma

    # Initializes a new Language instance with an options hash.
    # @param code [String] The three-character language code. Defaults to an
    #   empty string.
    # @param name [String] The language's name. Defaults to an empty string.
    # @param native_name [String] The language's autonym (native name).
    #   Defaults to an empty string.
    # @param ipa [String] The IPA transcription for the autonym. Defaults to
    #   an empty string.
    # @param type [Type] The language's type. Defaults to `nil`.
    # @param owners [Array<String>] The owner plus shared users of this
    #   language. The first element must be the original owner.
    # @param overview [String] The overview, about me section, or bio, of
    #   this language. Defaults to an empty string.
    # @param public [Boolean] Whether or not this language's dictionary is
    #   public. Defaults to `true`.
    # @param status [Status] The language's status. Defaults to `nil`.
    # @param registered [Time] When the language was registered. Defaults to
    #   the current time.
    # @param word_count [Integer] The amount of words this language has.
    #   Defaults to `0`.
    # @param karma [Array<(Integer, Integer)>] The language's karma counts.
    #   The first is upvotes, the second is downvotes. Defaults to zero for
    #   both.
    # @return [Language] The new Language instance.
    def initialize(code: '', name: '', native_name: '', ipa: '', type: nil,
                   owners: [], overview: '', public: true, status: '',
                   registered: Time.now, word_count: 0, karma: [0, 0])
      @code = code
      @name = name
      @native_name = native_name
      @ipa = ipa
      @type = type
      @owners = owners
      @overview = overview
      @public = public
      @status = status
      @registered = registered
      @word_count = word_count
      @karma = karma
    end

    # Generates a CWS link to this language.
    # @return [String] The generated link.
    def generate_link
      CWS_BASE + "/view_language.php?l=#{@code}"
    end

    # @overload inspect
    #   @return [String] A more meaningful output than that of the default
    #   inspect method, with all of Language's attributes.
    def inspect
      "<Language code=#{@code} name=#{@name} native_name=#{@native_name} " \
        "ipa=#{@ipa} type=#{@type} owners=#{@owners} overview=#{@overview} " \
        "public=#{@public} status=#{@status} registered=#{@registered} " \
        "word_count=#{@word_count} karma=#{@karma}>"
    end
  end
end
