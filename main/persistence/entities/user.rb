# File ./persistence/entity/user.rb
#
# Output Records via Mapping

module Entities

  class User < ROM::Struct
    attribute :id, Types::Strict::Int
    attribute :username, Types::Strict::String
    attribute :name, Types::Strict::String
    attribute :email, ::Types::Email
    attribute :password_digest, Types::Strict::String
    attribute :remember_token, Types::Strict::String.optional
    attribute :password_reset_token, Types::Strict::String.optional
    attribute :password_reset_date, Types::Strict::Time.optional
    attribute :assigned_groups, Types::Strict::Array.meta(desc: :yaml_array)
    attribute :roles, Types::Strict::Array.meta(desc: :yaml_array)
    attribute :active, Types::Strict::Bool
    attribute :file_access_token, Types::Strict::String.optional
    attribute :created_at, Types::Strict::Time
    attribute :updated_at, Types::Strict::Time
    attribute :person_authenticated_key, Types::Strict::String
    attribute :assigned_roles, Types::Strict::Array.meta(desc: :yaml_array)
    attribute :remember_token_digest , Types::Strict::String.optional
    attribute :user_options, Types::Strict::Array.meta(desc: :yaml_array)

    def pak
      person_authenticated_key
    end
  end

end
