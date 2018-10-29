# File ./main/persistence/entities/content_profile.rb
#
# Output Records via Mapping
# - Belongs to ProfileType
# - Has many ContentProfileEntry through content_profiles_entries

module Entities

  class ContentProfile < ROM::Struct

    def pak
      person_authentication_key
    end
  end

end
