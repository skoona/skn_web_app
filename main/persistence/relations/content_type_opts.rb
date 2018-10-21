# File: ./main/persistence/relations/content_type_opts.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class ContentTypeOpts < ROM::Relation[:sql]
    schema(:content_type_opts, infer: false) do

      attribute :id, ROM::SQL::Types::Serial
      attribute :value, ::Types::StringWithoutBlanks
      attribute :description, Types::Strict::String
      attribute :type_name, Types::Strict::String
      attribute :content_type_id, Types::ForeignKey(:content_types)
      attribute :created_at, Types::Time
      attribute :updated_at, Types::Time

      primary_key :id
      associations do
        belongs_to :content_types
      end
    end

    # See Namespace in Repository
    auto_struct true

    # Define some composable, reusable query methods to return filtered
    # results from our database table. We'll use them in a moment.
    def by_pk(id)
      where(id: id)
    end

  end

end
