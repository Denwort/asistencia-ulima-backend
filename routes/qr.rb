get '/qr/profesor' do

    profesor_id = params[:profesor_id].to_i

    puts "Recibido profesor_id: #{profesor_id}"
    
    # Obtener la sesión actual según la fecha de inicio
    sesion_actual = Sesion
        .join(:secciones, id: :seccion_id)
        .where(Sequel[:secciones][:profesor_id] => profesor_id)
        .where { fechaInicio <= Time.now }
        .where { fechaFin >= Time.now }
        .first

    if sesion_actual
        sesion_actual.update(registro: true)
        status 200
        {
            id: sesion_actual[:id],
            registro: sesion_actual.registro,
            fechaInicio: sesion_actual.fechaInicio,
            fechaFin: sesion_actual.fechaFin,          
            seccion_id: sesion_actual.seccion.id,
            seccion_codigo: sesion_actual.seccion.codigo,
            periodo: sesion_actual.seccion.periodo.nombre,
            curso: sesion_actual.seccion.curso.nombre
        }.to_json
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
            {
                id: asistencia.id,
                asistio: asistencia.asistio,
                alumno: {
                    id: asistencia.usuario.id,
                    rol: asistencia.usuario.rol,
                    nombres: asistencia.usuario.nombres,
                    apellidos: asistencia.usuario.apellidos,
                },
                sesion: {
                    id: asistencia.sesion.id,
                    registro: asistencia.sesion.registro,
                    fechaInicio: asistencia.sesion.fechaInicio,
                    fechaFin: asistencia.sesion.fechaFin,          
                    seccion_id: asistencia.sesion.seccion.id,
                    seccion_codigo: asistencia.sesion.seccion.codigo,
                    periodo: asistencia.sesion.seccion.periodo.nombre,
                    curso: asistencia.sesion.seccion.curso.nombre
                }
            }.to_json
        else
            status 400
            { error: 'La fecha actual no está dentro del rango de fechas de la sesión' }.to_json
        end
    else
        status 404
        { error: 'No se encontró la asistencia para la sesión y alumno especificados' }.to_json
    end
end
