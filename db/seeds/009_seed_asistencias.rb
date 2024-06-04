# db/seeds/005_seed_asistencias.rb
require 'sequel'

DB = Sequel.sqlite('db/app.db')

asistencias_data = [
  {
    asistio: false,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 23, 7)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: false,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 24, 7)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 28, 7)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 31, 7)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: false,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 29, 16)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 31, 11)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 22, 14)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: false,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 25, 14)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 29, 14)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno2').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 23, 7)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno2').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 24, 7)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: false,
    alumno_id: DB[:usuarios].where(usuario: 'alumno2').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 28, 7)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno2').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 31, 7)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: true,
    alumno_id: DB[:usuarios].where(usuario: 'alumno2').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 29, 16)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    asistio: false,
    alumno_id: DB[:usuarios].where(usuario: 'alumno2').first[:id],
    sesion_id: DB[:sesiones].where(fechaInicio: DateTime.new(2024, 5, 31, 11)).first[:id],
    created_at: Time.now,
    updated_at: Time.now
  }
]

asistencias_data.each do |asistencia|
  DB[:asistencias].insert(asistencia)
end

puts "Asistencias seeded successfully"
