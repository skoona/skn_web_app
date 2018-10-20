# File: ./main/persistence/relations/users.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class ProfileTypes < ROM::Relation[:sql]
    schema(:profile_types, infer: false) do

      attribute :id, Types::Serial
      attribute :name, Types::Strict::String
      attribute :description, Types::Strict::String
      attribute :created_at, Types::Strict::Time
      attribute :updated_at, Types::Strict::Time

      primary_key :id
      associations do
        has_many   :content_profiles
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
