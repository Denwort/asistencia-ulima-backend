Sequel.migration do
  change do
    create_table(:matriculas) do
      primary_key :id
      foreign_key :alumno_id, :usuarios, null: false, on_delete: :cascade
      foreign_key :seccion_id, :secciones, null: false, on_delete: :cascade
      DateTime :created_at
      DateTime :updated_at
    end
  end
end