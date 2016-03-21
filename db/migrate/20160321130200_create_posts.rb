Sequel.migration do
  change do
    create_table :posts do
      primary_key :id
      foreign_key :user_id, :users, index: true
      String :content, text: true
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
