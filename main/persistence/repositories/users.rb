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

    def by_id(id)
      root.by_pk(id).one
    end

    def find_by(col_val_hash)
      root.where(col_val_hash).to_a
    end

    def by_pak(pak, wprof=false)
      wprof ?
          root.where(person_authentication_key: pak).combine([:content_profiles]).one :
            root.where(person_authentication_key: pak).one
    end

    def with_profile(id)
      # root.where(id: id).combine([:content_profile]).one
      root.join(:content_profiles, person_authentication_key: :person_authentication_key)
    end

  end
end
