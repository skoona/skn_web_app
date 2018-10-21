# File ./main/persistence/entities/user.rb
#
# Output Records via Mapping

module Entities

  class User < ROM::Struct

    def pak
      person_authentication_key
    end
  end

end
