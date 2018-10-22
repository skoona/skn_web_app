

def system!(*args)
  system(*args) || SknApp.logger.error("\n== Command #{args} failed ==")
end

def do_not_care_command!(*args)
  system(*args)
end

namespace :db do

  task :setup do
    db_config = ROM::Configuration.new(:sql, SknSettings.postgresql.url, user: SknSettings.postgresql.user, password: SknSettings.postgresql.password)
    ROM::SQL::RakeSupport.env = ROM.container(db_config)
  end

  desc "Seed All Databases db:seed[dbenv]  values=[test|development|production]"
  task :seed, :dbenv do |t,args|
    dbname = args.with_defaults(dbenv: ENV['RACK_ENV'])[:dbenv]

    # ##
    # Alternate Approach to Seeding
    # connection = container.gateways[:default].connection
    # connection.execute "INSERT INTO categories (name) VALUES ('dry-rb')"

    SknApp.logger.info "== Seed #{dbname.upcase} DB =="
      system!("psql SknWebApp_#{dbname} < db/skn-seed.sql ")
    SknApp.logger.info "== Done Seeding #{dbname.upcase} database =="
  end
  
  desc "Setup Database Drop/Create/Migrate/Seed [dbenv]  values=[test|development|production]"
  task :skn_setup, :dbenv do |t,args|
    dbname = args.with_defaults(dbenv: ENV['RACK_ENV'])[:dbenv]

    SknApp.logger.info "== Drop #{dbname.upcase} DB =="
    do_not_care_command!("dropdb SknWebApp_#{dbname}")

    SknApp.logger.info "== Create #{dbname.upcase} DB =="
      system!("createdb -T template0 SknWebApp_#{dbname}")

    SknApp.logger.info "== Migrate #{dbname.upcase} DB =="
      Rake::Task["db:migrate"].invoke

    SknApp.logger.info "== Seed #{dbname.upcase} DB =="
      Rake::Task["db:seed"].invoke(dbname)

    SknApp.logger.info "== Setup Complete #{dbname.upcase} DB =="
  end 
       
end
