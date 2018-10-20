# File: ./main/persistence/relations/user_group_roles_user_roles.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class UserGroupRolesUserRoles < ROM::Relation[:sql]
    schema(:user_group_roles_user_roles, infer: false) do

      attribute :id, Types::Serial
      attribute :user_group_role_id, Types::ForeignKey(:user_group_roles)
      attribute :user_role_id, Types::ForeignKey(:user_roles)

      primary_key :id
      associations do
        belongs_to :user_roles
        belongs_to :user_group_roles
      end
    end
  end
end
