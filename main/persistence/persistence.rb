# File: ./main/persistence/persistence.rb
#

module Types
  include Dry::Types.module

  Dry::Types.load_extensions(:maybe)

  Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  SerializedArrayRead = Types.Constructor(Types.Array(Types::Strict::String)) { |yaml_str| yaml_str.nil? ? [] : Psych.load(yaml_str).compact }
  SerializedArrayWrite = Types.Constructor(Types::Strict::String) { |ary_of_str| ary_of_str.nil? ? Psych.dump([])  : Psych.dump(ary_of_str.compact) }

end


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



module Skn

# ## Initialize rom-rb
#
# rom-rb is built to be non-intrusive. When we initialize it here, all our
# relations and commands are bundled into a single container that we can
# inject into our app.
# ##

  db_config = ROM::Configuration.new(:sql, SknSettings.postgresql.url,
                       user: SknSettings.postgresql.user,
                       password: SknSettings.postgresql.password) do |config|

    config.gateways[:default].use_logger(Logging.logger['ROM'])

    config.register_relation Relations::Users
    # config.auto_registration('./main/persistence/', namespace: false)
  end

  SknApp.config.rom = ROM.container(db_config)

end

at_exit do
  SknApp.config.rom.disconnect
  SknApp.logger.perf 'Closed ROM-DB... '
end
