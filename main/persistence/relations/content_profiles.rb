# File: ./main/persistence/relations/content_profiles.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class ContentProfiles < ROM::Relation[:sql]
    schema(:content_profiles, infer: false) do

      attribute :id, ROM::SQL::Types::Serial
      attribute :person_authentication_key, Types::Strict::String.constrained(min_size: 32)
      attribute :profile_type_id, Types::ForeignKey(:profile_types)
      attribute :authentication_provider, Types::String
      attribute :username, Types::Strict::String
      attribute :display_name, Types::Strict::String
      attribute :email, ::Types::Email
      attribute :created_at, Types::Time
      attribute :updated_at, Types::Time

      primary_key :id
      associations do
        belongs_to :profile_type
        has_many   :content_profile_entries, through: :content_profiles_entries
      end
    end

    # See Namespace in Repository
    auto_struct true

    def by_pak(pak)
      where(person_authentication_key: pak)
    end
  end
end
