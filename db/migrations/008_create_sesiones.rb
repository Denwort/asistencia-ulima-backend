Sequel.migration do
  change do
    create_table(:sesiones) do
      primary_key :id
      TrueClass :registro, null: false, default: false
      DateTime :fechaInicio, null: false
      DateTime :fechaFin, null: false
      foreign_key :seccion_id, :secciones, null: false, on_delete: :cascade
      DateTime :created_at
      DateTime :updated_at
    end
  end
end