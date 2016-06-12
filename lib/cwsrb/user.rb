module Cwsrb
  # The User class represents an member of ConWorkShop.
  class User
    # @!attribute [r] id
    #   @return [String, Integer] The User's ID
    attr_reader :id

    # @!attribute [r] name
    #   @return [String] The User's name
    attr_reader :name

    # @!attribute [r] gender
    #   @return [String] The User's gender, one of "Male", "Female", "Cyborg" or "Other"
    attr_reader :gender

    # @!attribute [r] bio
    #   @return [String] The User's bio, max 1000 characters
    attr_reader :bio

    # @!attribute [r] country
    #   @return [String] The User's country
    attr_reader :country

    # @!attribute [r] karma
    #   @return [Array<(Integer, Integer)>] The User's karma counts. First one is upvotes and second one is downvotes.
    attr_reader :karma

    # Initializes a new User instance with an options hash.
    # @param id [String, Integer] The user's ID: a bunch of numbers that may or may not be prefixed with 'S'.
    # @param name [String] The user's name. Defaults to `nil`.
    # @param gender [String] The user's gender, one of "Male", "Female", "Cyborg" or "Other". Defaults to "Other".
    # @param bio [String] The user's bio or about section. Defaults to an empty string.
    # @param country [String] The user's country. Defaults to "Unknown".
    # @param karma [Array<(Integer, Integer)>] The user's karma counts (first is upvotes, second is downvotes). Defaults to zero for both.
    # @return [void] _dust_
    def initialize(id: nil, name: nil, gender: 'Other', bio: '', country: 'Unknown', karma: [0, 0])
      @id = id
      @name = name
      @gender = gender
      @bio = bio
      @country = country
      @karma = karma
    end

    # @overload inspect
    #   @return [String] A more meaningful output than that of the default inspect method, with all of User's attributes.
    def inspect
      "<User id=#{@id} name=#{@name} gender=#{gender} bio=#{bio} country=#{country} karma=#{karma}>"
    end
  end
end
