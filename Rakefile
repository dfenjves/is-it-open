task :environment do
  require_relative './config/environment'
end

namespace :db do
  task :migrate => [:environment] do
    require_relative './db/migrate/01_create_museums'
    CreateMuseums.migrate(:up)
  end
end

task :console => [:environment] do
	pry
end