# File: ./main/persistence/relations/content_profile_entries.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class ContentProfileEntries < ROM::Relation[:sql]
    schema(:content_profile_entries, infer: false) do

      attribute :id, Types::Serial

      attribute :topic_value, ::Types::SerializedArrayWrite.meta(desc: 'topic_value'), read: ::Types::SerializedArrayRead.meta(desc: 'topic_value')
      attribute :topic_type, ::Types::SerializedArrayWrite.meta(desc: 'topic_type'), read: ::Types::SerializedArrayRead.meta(desc: 'topic_type')
      attribute :topic_type_description, Types::Strict::String
      attribute :content_value, ::Types::SerializedArrayWrite.meta(desc: 'content_value'), read: ::Types::SerializedArrayRead.meta(desc: 'content_value')
      attribute :content_type, ::Types::SerializedArrayWrite.meta(desc: 'content_type'), read: ::Types::SerializedArrayRead.meta(desc: 'content_type')
      attribute :content_type_description, Types::Strict::String
      attribute :description, Types::Strict::String
      attribute :created_at, Types::Strict::Time
      attribute :updated_at, Types::Strict::Time

      primary_key :id
      associations do
        has_many :content_profiles, through: :content_profiles_entries
      end
    end

    # See Namespace in Repository
    auto_struct true

    # Define some composable, reusable query methods to return filtered
    # results from our database table. We'll use them in a moment.
    def by_id(id)
      where(id: id)
    end
  end
end
