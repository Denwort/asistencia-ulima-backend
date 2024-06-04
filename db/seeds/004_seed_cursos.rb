require 'sequel'

DB = Sequel.sqlite('db/app.db')

DB[:cursos].insert(
  nombre: 'Programacion movil',
  color: 'blue',
  carrera_id: DB[:carreras].where(nombre: 'Ingeniería de Sistemas').first[:id],
  nivel_id: DB[:niveles].where(nombre: 8).first[:id],
  created_at: Time.now,
  updated_at: Time.now
)

DB[:cursos].insert(
  nombre: 'Taller de propuesta de investigacion',
  color: 'red',
  carrera_id: DB[:carreras].where(nombre: 'Ingeniería de Sistemas').first[:id],
  nivel_id: DB[:niveles].where(nombre: 8).first[:id],
  created_at: Time.now,
  updated_at: Time.now
)

DB[:cursos].insert(
  nombre: 'Ingenieria de software 2',
  color: 'green',
  carrera_id: DB[:carreras].where(nombre: 'Ingeniería de Sistemas').first[:id],
  nivel_id: DB[:niveles].where(nombre: 8).first[:id],
  created_at: Time.now,
  updated_at: Time.now
)

puts "Cursos seeded successfully"