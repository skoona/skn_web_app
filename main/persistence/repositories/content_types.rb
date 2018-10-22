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
      aggregate(:content_type_opts).to_a
    end

    def query(conditions)
      aggregate(:content_type_opts)
          .where(conditions)
          .to_a
    end

    def [](id)
      aggregate(:content_type_opts)
          .by_pk(id)
          .one!
    end

    def by_id(id)
      aggregate(:content_type_opts)
          .by_pk(id)
          .one!
    end

    def find_by(col_val_hash)
      aggregate(:content_type_opts)
          .where(col_val_hash)
          .one
    end

    def with_opts(id)
      id.to_s.to_i.eql?(0) ?
          root.combine([:content_type_opts]).to_a :
            root.where(id: id).combine([:content_type_opts]).one
    end
  end
end