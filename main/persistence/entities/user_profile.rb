# File ./main/persistence/entities/user.rb
#
# Output Records via Mapping

module Entities

  class UserProfile < ROM::Struct


    attribute :content_profiles, Types::Strict::Array.of(Entities::ContentProfile)

    def pak
      person_authentication_key
    end
  end

end
