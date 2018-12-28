# File: ./main/persistence/repositories/users.rb
#

module Repositories

  class Users < ROM::Repository[:users]
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.command(:create_user).call(attrs)
    end

    def update(id, attrs)
      super root.by_pk(id).changeset(:update, attrs).map(){|rec| rec.merge(updated_at: Time.now.getlocal) }.commit
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
      aggregate(:content_profiles).by_pak(pak).one
    end

    def with_profiles(pak)
      aggregate(content_profiles: [:profile_type, :content_profile_entries]).by_pak(pak).one!
    end

  end
end
