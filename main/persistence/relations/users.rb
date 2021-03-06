# File: ./main/persistence/relations/users.rb
#

# Define a canonical schema for this relation. This will be used when we
# use commands to make changes to our data. It ensures that only
# appropriate attributes are written through to the database table.

module Relations

  class Users < ROM::Relation[:sql]
    struct_namespace ::Entities

    schema(:users, infer: false) do

      attribute :id, ROM::SQL::Types::Serial
      attribute :username, Types::Strict::String
      attribute :name, Types::Strict::String
      attribute :email, ::Types::Email
      attribute :password_digest, Types::Strict::String
      attribute :remember_token, Types::Strict::String.optional
      attribute :password_reset_token, Types::Strict::String.optional
      attribute :password_reset_date, Types::Strict::Time.optional
      attribute :assigned_groups, ::Types::SerializedArrayWrite.meta(desc: 'assigned_groups'), read: ::Types::SerializedArrayRead.meta(desc: 'assigned_groups')
      attribute :roles, ::Types::SerializedArrayWrite.meta(desc: 'roles'), read: ::Types::SerializedArrayRead.meta(desc: 'roles')
      attribute :active, Types::Strict::Bool
      attribute :file_access_token, Types::Strict::String.optional
      attribute :created_at, Types::Time
      attribute :updated_at, Types::Time
      attribute :person_authentication_key, Types::Strict::String.constrained(min_size: 32)
      attribute :assigned_roles, ::Types::SerializedArrayWrite.meta(desc: 'assigned_roles'), read: ::Types::SerializedArrayRead.meta(desc: 'assigned_roles')
      attribute :remember_token_digest , Types::Strict::String.optional
      attribute :user_options, ::Types::SerializedArrayWrite.meta(desc: 'user_options'), read: ::Types::SerializedArrayRead.meta(desc: 'user_options')

      primary_key :id
      associations do
        has_one :content_profiles, override: true, view: :for_users, combine_keys: {person_authentication_key: :person_authentication_key}
      end
    end

    # See Namespace in Repository
    auto_struct true

    def by_id(id)
      by_pk(id)
    end

    def by_pak(pak)
      where(person_authentication_key: pak)
    end

    def find_by(conditions) # {}
      where(conditions)
    end

    def for_profiles(_assoc, relation_dataset)
      where(person_authentication_key: relation_dataset.map { |rec| rec[:person_authentication_key] })
    end

  end
end
