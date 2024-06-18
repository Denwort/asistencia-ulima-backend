Sequel.migration do
    change do
      create_table(:periodos) do
        primary_key :id
        String :nombre, null: false
        DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
        DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      end
    end
  end