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

    def all(roles=false)
      roles ? root.combine([:user_roles]).to_a : root.to_a
    end

    def names
      root.pluck(:name)
    end

    def by_name(value, opts=false)
      opts ? root.where(name: value).combine([:user_roles]).one : root.where(name: value).one
    end

    def find_by(col_val_hash, opts=false)
      opts ? root.where(col_val_hash).combine([:user_roles]).to_a : root.where(col_val_hash).to_a
    end

    def by_id(id)
      root.by_pk(id).one!
    end

    def with_roles(id)
      root.where(id: id).combine([:user_roles]).one
    end
  end
end
