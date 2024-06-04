require 'sequel'

DB = Sequel.sqlite('db/app.db')

sesiones_data = [
  {
    fechaInicio: DateTime.new(2024, 5, 23, 7),
    fechaFin: DateTime.new(2024, 5, 23, 9),
    seccion_id: DB[:secciones].where(codigo: '830').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    fechaInicio: DateTime.new(2024, 5, 24, 7),
    fechaFin: DateTime.new(2024, 5, 24, 10),
    seccion_id: DB[:secciones].where(codigo: '830').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    fechaInicio: DateTime.new(2024, 5, 28, 7),
    fechaFin: DateTime.new(2024, 5, 28, 9),
    seccion_id: DB[:secciones].where(codigo: '830').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    fechaInicio: DateTime.new(2024, 5, 31, 7),
    fechaFin: DateTime.new(2024, 5, 31, 10),
    seccion_id: DB[:secciones].where(codigo: '830').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    fechaInicio: DateTime.new(2024, 5, 29, 16),
    fechaFin: DateTime.new(2024, 5, 29, 18),
    seccion_id: DB[:secciones].where(codigo: '833').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    fechaInicio: DateTime.new(2024, 5, 31, 11),
    fechaFin: DateTime.new(2024, 5, 31, 13),
    seccion_id: DB[:secciones].where(codigo: '833').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    fechaInicio: DateTime.new(2024, 5, 22, 14),
    fechaFin: DateTime.new(2024, 5, 22, 16),
    seccion_id: DB[:secciones].where(codigo: '831').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    fechaInicio: DateTime.new(2024, 5, 25, 14),
    fechaFin: DateTime.new(2024, 5, 25, 17),
    seccion_id: DB[:secciones].where(codigo: '831').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    fechaInicio: DateTime.new(2024, 5, 29, 14),
    fechaFin: DateTime.new(2024, 5, 29, 16),
    seccion_id: DB[:secciones].where(codigo: '831').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  }
]

sesiones_data.each do |sesion|
  DB[:sesiones].insert(sesion)
end

puts "Sesiones seeded successfully"