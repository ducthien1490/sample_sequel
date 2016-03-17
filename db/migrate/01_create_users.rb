Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :name, null: false
      DateTime :updated_at
      DateTime :created_at
    end
  end

  down do
    drop_tables(:users)
  end
end
