

def system!(*args)
  system(*args) || SknApp.logger.error("\n== Command #{args} failed ==")
end

namespace :db do
  desc "Seed All Databases db:seed[dbenv]  values=[test|development|production]"
  task :seed, :dbenv do |t,args|
    dbname = args.with_defaults(dbenv: ENV['RACK_ENV'])[:dbenv]

    SknApp.logger.info "== Seed #{dbname.upcase} DB =="
    system!("psql SknWebApp_#{dbname} < db/skn-seed.sql ")
    SknApp.logger.info "== Done Seeding #{dbname.upcase} database =="
  end
end
