# File ./persistence/entity/user.rb
#
# Output Records via Mapping

module Entities

  class User < ROM::Struct

    def pak
      person_authenticated_key
    end
  end

end
