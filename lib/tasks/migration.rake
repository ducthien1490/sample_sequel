namespace :database do
  desc 'Run migration'
  task :migrate, [:version] do |t, args|
    require 'sequel'
    Sequel.extension :migration
    db_config = YAML.load_file("config/database.yml")
    db = Sequel.connect(db_config[Rails.env])
    if args[:version]
      pust "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, 'db/migrate', tartget: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(db, 'db/migrate')
    end
  end
end
