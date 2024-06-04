Sequel.migration do
    change do
      create_table(:cursos) do
        primary_key :id
        String :nombre, null: false
        String :color, null: false
        foreign_key :carrera_id, :carreras, null: false, on_delete: :cascade
        foreign_key :nivel_id, :niveles, null: false, on_delete: :cascade
        DateTime :created_at
        DateTime :updated_at
      end
    end
  end