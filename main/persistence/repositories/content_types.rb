# File: ./main/persistence/repositories/content_types.rb
#

module Repositories

  class ContentTypes < ROM::Repository[:content_types]
    struct_namespace Entities
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps)
    end

    def update(attrs)
      super root.changeset(:update, attrs).map(:add_timestamps)
    end

    def all
      content_types.to_a
    end

    def query(conditions)
      content_types.where(conditions).to_a
    end

    def [](id)
      content_types.by_id(id).one
    end

    def by_id(id)
      content_types.by_id(id).one
    end

    def find_by(col_val_hash)
      content_types.where(col_val_hash).one
    end

    def group_roles(id)
      content_types.where(id: id).combine([:content_type_opts]).one
    end
  end
end
