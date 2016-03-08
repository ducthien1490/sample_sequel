namespace :database do
  desc 'Run migration'
  task :migrate, [:version] do |t, args|
    require 'sequel'
    require 'pry-rails'
    Sequel.extension :migration
    binding.pry
    db = Sequel.connect(ENV.fetch('DATABASE_URL'))
    if args[:version]
      pust "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, 'db/migrate', tartget: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(db, 'db/migrate')
    end
  end
end
