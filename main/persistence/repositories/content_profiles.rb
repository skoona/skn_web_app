# File: ./main/persistence/repositories/content_profiles.rb
#

module Repositories

  class ContentProfiles < ROM::Repository[:content_profiles]
    struct_namespace Entities
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps)
    end

    def update(attrs)
      super root.changeset(:update, attrs).map(:add_timestamps)
    end

    def all
      content_profiles.to_a
    end

    def query(conditions)
      content_profiles.where(conditions).to_a
    end

    def by_pak(pak)
      find_by(person_authentication_key: pak)
    end

    def [](id)
      content_profiles.by_id(id).one
    end

    def by_id(id)
      content_profiles.by_id(id).one
    end

    def find_by(col_val_hash)
      content_profiles.where(col_val_hash).one
    end

    def profile(id)
      content_profiles.where(id: id).combine([:profile_types, :content_profile_entries]).one
    end
  end
end
