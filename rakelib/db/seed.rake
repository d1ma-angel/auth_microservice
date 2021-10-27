namespace :db do
  desc 'Seed database'
  task seed: :settings do
    require_relative '../../config/environment'

    seed_file = './db/seeds.rb'
    load(seed_file) if File.exist?(seed_file)
  end
end
