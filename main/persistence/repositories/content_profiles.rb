# File: ./main/persistence/repositories/content_profiles.rb
#

module Repositories

  class ContentProfiles < ROM::Repository[:content_profiles]
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.command(:create_content_profile).call(attrs)
    end

    def update(id, attrs)
      super root.by_id(id).changeset(:update, attrs).map(){|rec| rec.merge(updated_at: Time.now.getlocal) }.commit
    end

    def all(entry=false)
      entry ?
          aggregate(:content_profile_entries, :profile_type).to_a :
            root.to_a
    end

    def by_id(id)
      root.by_id(id).one!
    end

    def by_pak(pak, entry=false)
      entry ?
          aggregate([:content_profile_entries, :profile_type]).by_pak(pak).one :
          root.by_pak(pak).one
    end

    def find_by(conditions, entry=false)
      entry ?
          aggregate([:content_profile_entries, :profile_type]).find_by(conditions).one :
          root.find_by(conditions).one
    end

    def with_user(id)
      aggregate([:users]).by_pk(id).one
    end

    def with_permissions_and_user(id)
      aggregate([:users, :content_profile_entries, :profile_type]).by_pk(id).one
    end

  end
end
