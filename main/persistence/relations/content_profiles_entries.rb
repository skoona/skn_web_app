# File: ./main/persistence/relations/content_profiles_entries.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class ContentProfilesEntries < ROM::Relation[:sql]
    schema(:content_profiles_entries, infer: false) do

      attribute :id, Types::Serial
      attribute :content_profile_id, Types::Int
      attribute :content_profile_entry_id, Types::Int

      primary_key :id
      associations do
        belongs_to :content_profiles
        belongs_to :content_profile_entries
      end
    end
  end
end
