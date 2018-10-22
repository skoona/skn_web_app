# File ./main/persistence/entities/content_profile.rb
#
# Output Records via Mapping
# - Belongs to ProfileType
# - Has many ContentProfileEntry through content_profiles_entries

module Entities

  class ContentProfile < ROM::Struct

    attribute :profile_types, Types::Strict::Class #.of(::Entities::ProfileType).optional
    attribute :content_profile_entries, Types::Strict::Array.of(::Entities::ContentProfileEntry).optional

    def pak
      person_authentication_key
    end
  end

end
