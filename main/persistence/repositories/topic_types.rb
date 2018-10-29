# File: ./main/persistence/repositories/topic_types.rb
#

module Repositories

  class TopicTypes < ROM::Repository[:topic_types]
    struct_namespace Entities
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps)
    end

    def update(attrs)
      super root.changeset(:update, attrs).map(:add_timestamps)
    end

    def all(opts=false)
      opts ? root.combine([:topic_type_opts]).to_a : root.to_a
    end

    def by_id(id)
      root.by_pk(id).one
    end

    def with_opts(id)
      root.where(id: id).combine([:topic_type_opts]).one
    end

    def names
      root.pluck(:name)
    end

    def by_name(value, opts=false)
      opts ? root.where(name: value).combine([:topic_type_opts]).one : root.where(name: value).one
    end

    def find_by(col_val_hash, opts=false)
      opts ? root.where(col_val_hash).combine([:topic_type_opts]).to_a : root.where(col_val_hash).to_a
    end

  end
end
