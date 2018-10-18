# File: ./persistence/repositories/users.rb
#

module Persistence
  module Repositories

    class Users < ROM::Repository[:users]
      struct_namespace Persistence::Entities

      def all
        users.to_a
      end

      def query(conditions)
        users.where(conditions).to_a
      end

      def by_pak(pak)
        find_by(person_authenticated_key: pak)
      end

      def [](id)
        users.by_id(id).one
      end

      def by_id(id)
        users.by_id(id).one
      end

      def find_by(col_val_hash)
        users.where(col_val_hash).one
      end

    end

  end
end
