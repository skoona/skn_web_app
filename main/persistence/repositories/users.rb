# File: ./main/persistence/repositories/users.rb
#

module Repositories

  class Users < ROM::Repository[:users]
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

    def query(conditions)
      root.where(conditions).to_a
    end

    def by_pak(pak)
      find_by(person_authentication_key: pak)
    end

    def [](id)
      root.by_pk(id).one
    end

    def by_id(id)
      root.by_pk(id).one
    end

    def find_by(col_val_hash)
      root.where(col_val_hash).one
    end

  end

end
