# File: ./main/persistence/repositories/user_roles.rb
#

module Repositories

  class UserRoles < ROM::Repository[:user_roles]
    struct_namespace Entities
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps)
    end

    def update(attrs)
      super root.changeset(:update, attrs).map(:add_timestamps)
    end


    def all
      root.to_a
    end

    def names
      root.pluck(:name)
    end

    def by_name(value)
      root.where(name: value).one
    end

    def by_id(id)
      root.by_pk(id).one
    end

    def find_by(col_val_hash)
      root.where(col_val_hash).to_a
    end

    def with_groups(id)
      root.where(id: id).combine([:user_group_roles]).one
    end

  end
end
