# File ./main/persistence/entities/user.rb
#
# Output Records via Mapping

module Entities

  class User < ROM::Struct

    # attribute :content_profiles, Types::Array.of(:content_profiles)

    def pak
      person_authentication_key
    end
  end

end
