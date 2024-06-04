Sequel.migration do
  change do
    create_table(:usuarios) do
      primary_key :id
      String :usuario, null: false
      String :contrasenia, null: false
      String :rol, null: false
      String :nombres, null: false
      String :apellidos, null: false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end