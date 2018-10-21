# File: ./main/persistence/persistence.rb
#


['entities', 'relations',
 'commands', 'repositories'].each do |db_mod|
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
                             # Commands::CreateContentProfile  -- registering commands raise an error
  end

  SknApp.configure do |cfg|
    cfg.rom = ROM.container(db_config)
  end
end

# ##
# Shutdown and Disconnect Rom-RB
at_exit do
  SknApp.config.rom.disconnect
  SknApp.logger.perf 'Closed ROM-RB... '
end
