# db/seeds/005_seed_asistencias.rb
require 'sequel'

DB = Sequel.sqlite('db/app.db')

def generar_asistencias(usuario)
  alumno_id = DB[:usuarios].where(usuario: usuario).first[:id]
  secciones_ids = DB[:matriculas].where(alumno_id: alumno_id).select(:seccion_id).map(:seccion_id)
  asistencias_data = []
  secciones_ids.each do |seccion_id|
    sesiones = DB[:sesiones].where(seccion_id: seccion_id).all
    sesiones.each do |sesion|
      asistencias_data << {
        asistio: false,
        alumno_id: alumno_id,
        sesion_id: sesion[:id]
      }
    end
  end
  asistencias_data
end

asistencias = []
asistencias.concat(generar_asistencias('alumno'))
asistencias.concat(generar_asistencias('alumno2'))

asistencias.each do |asistencia|
  DB[:asistencias].insert(asistencia)
end

puts "Asistencias seeded successfully"
