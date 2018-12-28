# File: ./main/persistence/relations/content_type_opts.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class ContentTypeOpts < ROM::Relation[:sql]
    struct_namespace ::Entities

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

    def by_id(id)
      by_pk(id)
    end

    def find_by(conditions) # {}
      where(conditions)
    end

    def by_name(value)
      where(type_name: value)
    end
  end

end
