# File: ./main/persistence/relations/content_profile_entries.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class ContentProfileEntries < ROM::Relation[:sql]
    struct_namespace ::Entities

    schema(:content_profile_entries, infer: false) do

      attribute :id, ROM::SQL::Types::Serial

      attribute :topic_value, ::Types::SerializedArrayWrite.meta(desc: 'topic_value'), read: ::Types::SerializedArrayRead.meta(desc: 'topic_value')
      attribute :topic_type, Types::Strict::String
      attribute :topic_type_description, Types::Strict::String
      attribute :content_value, ::Types::SerializedArrayWrite.meta(desc: 'content_value'), read: ::Types::SerializedArrayRead.meta(desc: 'content_value')
      attribute :content_type, Types::Strict::String
      attribute :content_type_description, Types::Strict::String
      attribute :description, Types::Strict::String
      attribute :created_at, Types::Time
      attribute :updated_at, Types::Time

      primary_key :id
      associations do
        has_many :content_profiles, through: :content_profiles_entries
      end
    end

    # See Namespace in Repository
    auto_struct true

    def by_id(id)
      by_pk(id)
    end

    def find_by(conditions) # {}
      where(conditions)
    end
  end
end
