# File: ./main/persistence/persistence.rb
#

class DuplicateAuthenticationKeyError < StandardError; end

[
    "entities/profile_type",
    "entities/content_profile_entry","entities/content_profile",
    "entities/user", "entities/user_role", "entities/user_group_role",
    "entities/content_type_opt", "entities/content_type",
    "entities/topic_type_opt", "entities/topic_type"
].each do |rom_resource|
  begin
    require_relative rom_resource
  rescue LoadError => e
    puts "[ROM Setup] Ignoring Exception for: #{e.class} #{e.message}"
  end
end

['relations', 'commands', 'repositories'].each do |db_mod|
  Dir["./main/persistence/#{db_mod}/*.rb"].each do |rom_resource|
    begin
      require rom_resource
    rescue LoadError => e
      puts "[ROM Setup] Ignoring Exception for: #{e.class} #{e.message}"
    end
  end
end



# ##
# Initialize rom-rb
module Skn

  class PersonAuthenticationKeyNotUnique < ::StandardError
  end

  db_config = ROM::Configuration.new(:sql, SknSettings.postgresql.url,
                       user: SknSettings.postgresql.user,
                       password: SknSettings.postgresql.password) do |config|

    config.gateways[:default].use_logger(Logging.logger['ROM'])

    config.register_relation Relations::Users,
                             Relations::ProfileTypes,
                             Relations::ContentProfiles,
                             Relations::ContentProfileEntries,
                             Relations::ContentProfilesEntries,
                             Relations::UserRoles,
                             Relations::UserGroupRoles,
                             Relations::UserGroupRolesUserRoles,
                             Relations::ContentTypes,
                             Relations::ContentTypeOpts,
                             Relations::TopicTypes,
                             Relations::TopicTypeOpts
    config.register_command  Commands::CreateUser,
                             Commands::CreateContentProfile
  end

  SknApp.configure do |cfg|
    cfg.rom = ROM.container(db_config)
  end
end

# ##
# Shutdown and Disconnect Rom-RB
at_exit do
  SknApp.rom.disconnect
  SknApp.logger.perf 'Closed ROM-RB... '
end
