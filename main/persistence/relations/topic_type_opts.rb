# File: ./main/persistence/relations/topic_type_opts.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class TopicTypeOpts < ROM::Relation[:sql]
    schema(:topic_type_opts, infer: false) do

      attribute :id, ROM::SQL::Types::Serial
      attribute :value, ::Types::StringWithoutBlanks
      attribute :description, Types::Strict::String
      attribute :type_name, Types::Strict::String
      attribute :topic_type_id, Types::ForeignKey(:topic_types)
      attribute :created_at, Types::Time
      attribute :updated_at, Types::Time

      primary_key :id
      associations do
        belongs_to :topic_types
      end
    end

    # See Namespace in Repository
    auto_struct true
  end

end
