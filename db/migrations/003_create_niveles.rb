Sequel.migration do
    change do
      create_table(:niveles) do
        primary_key :id
        Integer :nombre, null: false
        DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
        DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      end
    end
  end