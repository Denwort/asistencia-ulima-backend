Sequel.migration do
  change do
    create_table(:asistencias) do
      primary_key :id
      TrueClass :asistio, null: false, default: false
      foreign_key :alumno_id, :usuarios, null: false, on_delete: :cascade
      foreign_key :sesion_id, :sesiones, null: false, on_delete: :cascade
      DateTime :created_at
      DateTime :updated_at
    end
  end
end