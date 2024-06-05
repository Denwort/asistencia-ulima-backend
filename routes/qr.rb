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

    alumno_id = params[:alumno_id].to_i

    puts "Recibido alumno_id: #{alumno_id}"

    # Obtener las secciones del profesor
    asistencias = Asistencia.where(alumno_id: alumno_id)

    # Obtener la sesión actual según la fecha de inicio
    sesion_actual = nil
    asistencia_actual = nil
    asistencias.each do |asistencia|
        sesion_actual = Sesion.join(:secciones, :secciones__id => :sesiones__seccion_id)
                              .where{ fechaInicio <= Time.now }
                              .where{ fechaFin >= Time.now }
                              .where(:secciones__id => asistencia.sesion.seccion_id)
                              .order(:fechaInicio)
                              .first
        if sesion_actual
            asistencia_actual = Asistencia.where(alumno_id: alumno_id, sesion_id: sesion_actual.id).first
            break if asistencia_actual
        end
    end

    if asistencia_actual
        asistencia_actual.to_json
    else
        status 404
        { error: 'No se encontró una sesión actual para el alumno' }.to_json
    end
end
