require 'sinatra'
require 'json'
require 'sequel'

get '/profesor/sesiones' do
  seccion_id = params[:seccion_id].to_i

  puts "Recibido seccion_id: #{seccion_id}"

  # Buscar las sesiones por seccion_id
  sesiones = Sesion.where(seccion_id: seccion_id).all

  if sesiones.any?
    status 200
    sesiones.map { |sesion|
      {
        id: sesion.id,
        fechaInicio: sesion.fechaInicio,
        fechaFin: sesion.fechaFin,
        seccion_id: sesion.seccion_id
      }
    }.to_json
  else
    status 404
    { error: 'No se encontraron sesiones para la sección especificada.' }.to_json
  end
end

get '/profesor/asistencias' do
    sesion_id = params[:sesion_id].to_i
  
    puts "Recibido sesion_id: #{sesion_id}"
    
    queryCursosAlumnos = <<-STRING
          SELECT asistencias.*, usuarios.nombres, usuarios.apellidos
FROM asistencias
INNER JOIN usuarios ON usuarios.id = asistencias.alumno_id
WHERE asistencias.sesion_id = #{sesion_id}
        STRING
    # Buscar las asistencias por sesion_id y unir con la tabla de usuarios
    asistencias = DB[queryCursosAlumnos].all
  
    if asistencias.any?
      status 200
      asistencias.map { |asistencia|
        {
          id: asistencia[:id],
          asistio: asistencia[:asistio],
          alumno_id: asistencia[:alumno_id],
          sesion_id: asistencia[:sesion_id],
          nombres: asistencia[:nombres],
          apellidos: asistencia[:apellidos],
          created_at: asistencia[:created_at],
          updated_at: asistencia[:updated_at]
        }
      }.to_json
    else
      status 404
      { error: 'No se encontraron asistencias para la sesión especificada.' }.to_json
    end
end

post '/profesor/modificarAsistencia' do
    asistencia_id = params[:asistencia_id].to_i
    asistio = params[:asistio]
  
    puts "Recibido asistencia_id: #{asistencia_id}, asistio: #{asistio}"
  
    # Buscar la asistencia por ID
    asistencia = Asistencia.where(id: asistencia_id).first
  
    if asistencia
      asistencia.update(asistio: asistio)
      status 200
      {
        message: 'Asistencia actualizada correctamente.',
        asistencia: {
          id: asistencia.id,
          asistio: asistencia.asistio,
          alumno_id: asistencia.alumno_id,
          sesion_id: asistencia.sesion_id,
          created_at: asistencia.created_at,
          updated_at: asistencia.updated_at
        }
      }.to_json
    else
      status 404
      { error: 'No se encontró la asistencia especificada.' }.to_json
    end
end