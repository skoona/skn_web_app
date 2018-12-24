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
      root.by_id(id).one
    end

    def by_pak(pak)
      root.where(person_authentication_key: pak).one
    end

    def find_by(col_val_hash)
      root.where(col_val_hash).one
    end

    def with_profile(pak)
      users.combine([content_profile: :profile_type]).where(person_authentication_key: pak).one
    end

    def with_profiles(pak)
      aggregate(content_profile: [:profile_type, :content_profile_entries]).where(person_authentication_key: pak).one
    end

  end
end
