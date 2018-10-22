# File: ./main/persistence/repositories/user_group_roles.rb
#

module Repositories

  class UserGroupRoles < ROM::Repository[:user_group_roles]
    commands :create, update: :by_pk, delete: :by_pk
    struct_namespace Entities

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps)
    end

    def update(attrs)
      super root.changeset(:update, attrs).map(:add_timestamps)
    end

    def all
      aggregate(:user_roles).to_a
    end

    def query(conditions)
      aggregate(:user_roles)
          .where(conditions)
          .to_a
    end

    def [](id)
      aggregate(:user_roles)
          .by_pk(id)
          .one!
    end

    def by_id(id)
      aggregate(:user_roles)
          .by_pk(id)
          .one
    end

    def find_by(col_val_hash)
      aggregate(:user_roles)
          .where(col_val_hash)
          .one
    end

    def with_roles(id)
      id.to_s.to_i.eql?(0) ?
        root.combine([:user_roles]).to_a :
          root.where(id: id).combine([:user_roles]).one
    end
  end
end
