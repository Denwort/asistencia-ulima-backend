Sequel.migration do
    change do
      create_table(:periodos) do
        primary_key :id
        String :nombre, null: false
        DateTime :created_at
        DateTime :updated_at
      end
    end
  end