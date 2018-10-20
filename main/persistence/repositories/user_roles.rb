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
      user_roles.to_a
    end

    def query(conditions)
      user_roles.where(conditions).to_a
    end

    def [](id)
      user_roles.by_id(id).one
    end

    def by_id(id)
      user_roles.by_id(id).one
    end

    def find_by(col_val_hash)
      user_roles.where(col_val_hash).one
    end

    # def group_roles(id)
    #   user_roles.where(id: id).combine([:user_group_roles]).one
    # end
  end
end
