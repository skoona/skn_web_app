# File ./main/persistence/entities/user_group_role.rb
#
# Output Records via Mapping
# - Has many UserRole through user_group_roles_user_roles

module Entities

  class UserGroupRole < ROM::Struct
    attribute :roles, Types::Strict::Array.of(::Entities::UserRole).optional

  end

end
