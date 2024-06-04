Sequel.migration do
    change do
      create_table(:secciones) do
        primary_key :id
        String :codigo, null: false
        String :periodo, null: false
        String :curso, null: false
        foreign_key :profesor_id, :usuarios, null: false, on_delete: :cascade
        DateTime :created_at
        DateTime :updated_at
      end
    end
  end