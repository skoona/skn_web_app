# File: ./main/persistence/repositories/group_roles.rb
#

module Repositories

  class GroupRoles < ROM::Repository[:user_group_roles]
    struct_namespace Entities
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps)
    end

    def update(attrs)
      super root.changeset(:update, attrs).map(:add_timestamps)
    end

    def all
      root..to_a
    end

    def query(conditions)
      root..where(conditions).to_a
    end

    def [](id)
      root..by_pk(id).one
    end

    def by_id(id)
      root.by_pk(id).one
    end

    def find_by(col_val_hash)
      root.where(col_val_hash).one
    end

    def with_user_roles(id)
      root.where(id: id).combine([:user_roles]).one
    end
  end
end
