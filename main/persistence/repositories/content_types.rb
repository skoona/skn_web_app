# File: ./main/persistence/repositories/content_types.rb
#

module Repositories

  class ContentTypes < ROM::Repository[:content_types]
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps).commit
    end

    def update(id, attrs)
      super root.by_id(id).changeset(:update, attrs).map(){|rec| rec.merge(updated_at: Time.now.getlocal) }.commit
    end

    def all(opts=false)
      opts ? aggregate([:content_type_opts]).to_a : root.to_a
    end

    def by_id(id)
      root.by_id(id).one
    end

    def with_opts(id)
      aggregate([:content_type_opts]).by_id(id).one
    end

    def names
      root.pluck(:name)
    end

    def by_name(value, opts=false)
      opts ? aggregate([:content_type_opts]).by_name(value).one : root.by_name(value).one
    end

    def find_by(conditions, opts=false)
      opts ? aggregate([:content_type_opts]).find_by(conditions).to_a : root.find_by(conditions).to_a
    end

  end
end
