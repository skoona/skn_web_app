# File: ./main/persistence/repositories/user_group_roles.rb
#

module Repositories

  class UserGroupRoles < ROM::Repository[:user_group_roles]
    commands :create, update: :by_pk, delete: :by_pk

    def create(attrs)
      super root.changeset(:create, attrs).map(:add_timestamps).commit
    end

    def update(id, attrs)
      super root.by_id(id).changeset(:update, attrs).map(){|rec| rec.merge(updated_at: Time.now.getlocal) }.commit
    end

    def all(roles=false)
      roles ? aggregate([:user_roles]).to_a : root.to_a
    end

    def by_id(id)
      root.by_id(id).one!
    end

    def find_by(conditions)
      root.find_by(conditions).to_a
    end

    def names
      root.pluck(:name)
    end

    def by_name(value, opts=false)
      opts ? aggregate([:user_roles]).by_name(value).one : root.by_name(value).one
    end

    def by_group(value, opts=false)
      opts ? aggregate([:user_roles]).by_group(value).one : root.by_group(value).one
    end

    def with_roles(id)
      aggregate([:user_roles]).by_id(id).one
    end

  end
end
