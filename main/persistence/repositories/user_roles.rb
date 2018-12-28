# File: ./main/persistence/repositories/user_roles.rb
#

module Repositories

  class UserRoles < ROM::Repository[:user_roles]
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps).commit
    end

    def update(id, attrs)
      super root.by_id(id).changeset(:update, attrs).map(){|rec| rec.merge(updated_at: Time.now.getlocal) }.commit
    end


    def all
      root.to_a
    end

    def by_id(id)
      root.by_id(id).one
    end

    def find_by(conditions)
      root.find_by(conditions).to_a
    end

    def names
      root.pluck(:name)
    end

    def by_name(value)
      root.by_name(value).one
    end

    def with_groups(id)
      aggregate([:user_group_roles]).by_id(id).one
    end

  end
end
