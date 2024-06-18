Sequel.migration do
  change do
    create_table(:usuarios) do
      primary_key :id
      String :usuario, null: false
      String :contrasenia, null: false
      String :rol, null: false
      String :nombres, null: false
      String :apellidos, null: false
      String :correo, null: false
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end