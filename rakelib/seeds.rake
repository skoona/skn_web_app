

def system!(*args)
  system(*args) || fail("\n== Command #{args} failed ==")
end

namespace :db do
  desc "Seed All Databases"
  task :seed do

    puts "\n== Seed #{SknApp.env.upcase} DB =="
    system!("psql SknWebApp_#{SknApp.env} < db/skn-seed.sql ")
    puts "\n== Done Seeding database =="

  end
end
