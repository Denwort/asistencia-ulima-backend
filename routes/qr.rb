get '/qr/profesor' do

    profesor_id = params[:profesor_id].to_i

    puts "Recibido profesor_id: #{profesor_id}"

    # Obtener las secciones del profesor
    secciones = Seccion.where(profesor_id: profesor_id)

    # Obtener la sesión actual según la fecha de inicio
    sesion_actual = nil
    secciones.each do |seccion|
        sesion_actual = Sesion.where(seccion_id: seccion.id)
                                .where{ fechaInicio <= Time.now }
                                .where{ fechaFin >= Time.now }
                                .order(:fechaInicio)
                                .first
        break if sesion_actual
    end

    if sesion_actual
        sesion_actual.to_json
    else
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
        puts "Sesion : id=#{sesion.id}"
        fecha_actual = Time.now
        if sesion.fechaInicio <= fecha_actual && fecha_actual <= sesion.fechaFin
            asistencia.update(asistio: true)
            status 200
            asistencia.to_json
        else
            status 400
            { error: 'La fecha actual no está dentro del rango de fechas de la sesión' }.to_json
        end
    else
        status 404
        { error: 'No se encontró la asistencia para la sesión y alumno especificados' }.to_json
    end
end
