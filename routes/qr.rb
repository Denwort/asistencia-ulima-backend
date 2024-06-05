get '/qr/profesor' do

    puts "Llamado"
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