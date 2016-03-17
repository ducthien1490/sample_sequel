db_config = YAML.load_file("#{Rails.root}/config/database.yml")
Sequel.connect(db_config[Rails.env])
Sequel::Model.plugin :timestamps
