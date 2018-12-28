# File: ./main/persistence/relations/user_roles.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class UserRoles < ROM::Relation[:sql]
    struct_namespace ::Entities

    schema(:user_roles, infer: false) do

      attribute :id, ROM::SQL::Types::Serial
      attribute :name, Types::Strict::String
      attribute :description, Types::Strict::String
      attribute :created_at, Types::Time
      attribute :updated_at, Types::Time

      primary_key :id
      associations do
        has_many :user_group_roles, through: :user_group_roles_user_roles
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
      where(name: value)
    end
  end
end
