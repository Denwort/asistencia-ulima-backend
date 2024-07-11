get '/qr/profesor' do

    profesor_id = params[:profesor_id].to_i

    puts "Recibido profesor_id: #{profesor_id}"
    
    # Obtener la sesión actual según la fecha de inicio
    sesion_actual = DB.fetch("SELECT s.* FROM sesiones s
                         JOIN secciones se ON s.seccion_id = se.id
                         WHERE se.profesor_id = ? AND s.fechaInicio <= ? AND s.fechaFin >= ?
                         LIMIT 1", profesor_id, Time.now, Time.now).first

    if sesion_actual
        sesion_actual.update(registro: true)
        sesion_actual.to_json
    else
        puts "Sin sesion actual"
        status 404
        { error: 'No se encontró una sesión actual para el profesor' }.to_json
    end
end

get '/qr/alumno' do

    sesion_id = params[:sesion_id].to_i
    alumno_id = params[:alumno_id].to_i

    puts "Recibido sesion_id: #{sesion_id}, alumno_id: #{alumno_id}"

    # Buscar la asistencia correspondiente
    asistencia = Asistencia.where(sesion_id: sesion_id, alumno_id: alumno_id).first

    if asistencia
        sesion = asistencia.sesion
        puts "Asistencia : id=#{asistencia.id}"
        fecha_actual = Time.now
        if sesion.fechaInicio <= fecha_actual && fecha_actual <= sesion.fechaFin
            asistencia.update(asistio: true)
            status 200
            asistencia.to_custom_json
        else
            status 400
            { error: 'La fecha actual no está dentro del rango de fechas de la sesión' }.to_json
        end
    else
        status 404
        { error: 'No se encontró la asistencia para la sesión y alumno especificados' }.to_json
    end
end
