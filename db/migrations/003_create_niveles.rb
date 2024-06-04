Sequel.migration do
    change do
      create_table(:niveles) do
        primary_key :id
        Integer :nombre, null: false
        DateTime :created_at
        DateTime :updated_at
      end
    end
  end