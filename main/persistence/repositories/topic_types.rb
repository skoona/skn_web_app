# File: ./main/persistence/repositories/topic_types.rb
#

module Repositories

  class TopicTypes < ROM::Repository[:content_types]
    struct_namespace Entities
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps)
    end

    def update(attrs)
      super root.changeset(:update, attrs).map(:add_timestamps)
    end

    def all
      topic_types.to_a
    end

    def query(conditions)
      topic_types.where(conditions).to_a
    end

    def [](id)
      topic_types.by_id(id).one
    end

    def by_id(id)
      topic_types.by_id(id).one
    end

    def find_by(col_val_hash)
      topic_types.where(col_val_hash).one
    end

    def group_roles(id)
      topic_types.where(id: id).combine([:topic_type_opts]).one
    end
  end
end
