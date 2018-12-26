# File: ./main/persistence/repositories/users.rb
#

module Repositories

  class Users < ROM::Repository[:users]
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps).commit
    end

    def update(attrs)
      super root.changeset(:update, attrs).map(){|rec| rec.merge(updated_at: Time.now.getlocal) }.commit
    end

    def all
      root.to_a
    end

    def by_id(id)
      root.by_id(id).one!
    end

    def by_pak(pak)
      root.by_pak(pak).one
    end

    def find_by(conditions)
      root.find_by(conditions).one
    end

    def with_profile(pak)
      aggregate(:content_profiles).find_by(person_authentication_key: pak).one
    end

    def with_profiles(pak)
      aggregate(content_profiles: [:profile_type, :content_profile_entries]).find_by(person_authentication_key: pak).one
    end

  end
end
