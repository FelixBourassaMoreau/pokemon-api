namespace :db do
    desc "Seed the database"
    task :seed => :environment do
        load Rails.root.join("db", "seeds.rb")
      end
  end