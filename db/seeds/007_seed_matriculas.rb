require 'sequel'

DB = Sequel.sqlite('db/app.db')

matriculas_data = [
  {
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    seccion_id: DB[:secciones].where(codigo: '830').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    seccion_id: DB[:secciones].where(codigo: '833').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    alumno_id: DB[:usuarios].where(usuario: 'alumno').first[:id],
    seccion_id: DB[:secciones].where(codigo: '831').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    alumno_id: DB[:usuarios].where(usuario: 'alumno2').first[:id],
    seccion_id: DB[:secciones].where(codigo: '830').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    alumno_id: DB[:usuarios].where(usuario: 'alumno2').first[:id],
    seccion_id: DB[:secciones].where(codigo: '833').first[:id],
    created_at: Time.now,
    updated_at: Time.now
  }
]

matriculas_data.each do |matricula|
  DB[:matriculas].insert(matricula)
end

puts "Matriculas seeded successfully"