Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:users) do
      primary_key :id, :type=>"int(11)"
      column :name, "varchar(255)"
      column :created_at, "datetime"
      column :updated_at, "datetime"
    end
    
    create_table(:posts) do
      primary_key :id, :type=>"int(11)"
      foreign_key :user_id, :users, :type=>"int(11)", :key=>[:id]
      column :content, "text"
      column :created_at, "datetime"
      column :updated_at, "datetime"
      
      index [:user_id]
    end
  end
end
              Sequel.migration do
                change do
                  self << "INSERT INTO `schema_migrations` (`filename`) VALUES ('20160321130123_create_users.rb')"
self << "INSERT INTO `schema_migrations` (`filename`) VALUES ('20160321130200_create_posts.rb')"
                end
              end
