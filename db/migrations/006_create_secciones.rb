Sequel.migration do
  change do
    create_table(:secciones) do
      primary_key :id
      String :codigo, null: false
      foreign_key :periodo_id, :periodos, null: false, on_delete: :cascade
      foreign_key :curso_id, :cursos, null: false, on_delete: :cascade
      foreign_key :profesor_id, :usuarios, null: false, on_delete: :cascade
      DateTime :created_at
      DateTime :updated_at
    end
  end
end