ROM::SQL.migration do
  change do

    create_table(:profile_types) do
      primary_key :id, :null=>false
      String :name
      String :description
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end

    create_table(:content_profile_entries) do
      primary_key :id, :null=>false
      String :topic_value, size: 8192, null: false
      String :topic_type
      String :topic_type_description
      String :content_value, size: 8192, null: false
      String :content_type
      String :content_type_description
      String :description
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end

    create_table(:content_profiles) do
      primary_key :id, :null=>false
      String :person_authentication_key, null: false
      foreign_key :profile_type_id, :profile_types, on_delete: :restrict, on_update: :restrict
      String :authentication_provider
      String :username
      String :display_name
      String :email
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
      unique :person_authentication_key
    end

    create_table(:content_profiles_entries) do
      primary_key :id, :null=>false
      foreign_key :content_profile_id, :content_profiles, on_delete: :cascade, on_update: :cascade
      foreign_key :content_profile_entry_id, :content_profile_entries, on_delete: :cascade, on_update: :cascade
      index [:content_profile_id, :content_profile_entry_id]
    end

    create_table(:content_types) do
      primary_key :id, :null=>false
      String :name
      String :description
      String :value_data_type
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end

    create_table(:content_type_opts) do
      primary_key :id, :null=>false
      String :value
      String :description
      String :type_name
      foreign_key :content_type_id, :content_types, on_delete: :cascade, on_update: :cascade
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end

    create_table(:topic_types) do
      primary_key :id, :null=>false
      String :name
      String :description
      String :value_based_y_n
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end

    create_table(:topic_type_opts) do
      primary_key :id, :null=>false
      String :value
      String :description
      String :type_name
      foreign_key :topic_type_id, :topic_types, on_delete: :cascade, on_update: :cascade
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end

    create_table(:user_group_roles) do
      primary_key :id, :null=>false
      String :name
      String :description
      String :group_type
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end

    create_table(:user_roles) do
      primary_key :id, :null=>false
      String :name
      String :description
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end

    create_table(:user_group_roles_user_roles) do
      primary_key :id, :null=>false
      foreign_key :user_group_role_id, :user_group_roles, on_delete: :cascade, on_update: :cascade
      foreign_key :user_role_id, :user_roles, on_delete: :cascade, on_update: :cascade
      index [:user_group_role_id, :user_role_id]
    end

    create_table(:users) do
      primary_key :id, :null=>false
      String :username, :null=>false
      String :name
      String :email
      String :password_digest, size: 1024
      String :remember_token, size: 1024
      String :password_reset_token, size: 1024
      DateTime :password_reset_date
      String :assigned_groups, size: 8192, null: false
      String :roles, size: 8192, null: false
      TrueClass :active, :default=>true
      String :file_access_token
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
      String :person_authentication_key, null: false
      String :assigned_roles, size: 8192, null: false
      String :remember_token_digest, size: 1024
      String :user_options, size: 8192, null: false
      unique :person_authentication_key
    end

    # create_table(:schema_migrations) do
    #   String :version, size: 512, :null=>false
    # end

  end
end
