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
      aggregate(:content_profile_entries, :profile_types).to_a
    end

    def query(conditions)
      aggregate(:content_profile_entries, :profile_types)
          .where(conditions)
          .to_a
    end

    def by_pak(pak)
      find_by(person_authentication_key: pak)
    end

    def [](id)
      aggregate(:content_profile_entries, :profile_types)
          .by_pk(id)
          .one!
    end

    def by_id(id)
      root.by_pk(id).one
    end

    def find_by(col_val_hash)
      aggregate(:content_profile_entries, :profile_types)
          .where(col_val_hash)
          .one
    end

    def with_entries(id)
      id.to_s.to_i.eql?(0) ?
          root.combine([:content_profile_entries, :profile_types]).to_a :
          root.where(id: id).combine([:content_profile_entries, :profile_types]).one
    end

    def with_user(id)
        id.to_s.to_i.eql?(0) ?
            root.combine([:user]).to_a :
            root.where(id: id).combine([:user]).one
    end

    def new_unique_profile(bundle)
      pkg = bundle.dup
      pak = pkg["person_authentication_key"] || pkg[:person_authentication_key]
      if !!pak and !!find_by(person_authentication_key: pak)
        SknApp.logger.error("[Repositories::ContentProfile] Create Failed!, Key: #{pak} is a duplicate key!")
        nil

      elsif pak.nil?
        pkg[:person_authentication_key] = SecureRandom.uuid.gsub('-','')
        root.changeset(:create, pkg).map(:add_timestamps).commit

      else
        root.changeset(:create, pkg).map(:add_timestamps).commit

      end
    end

  end
end
