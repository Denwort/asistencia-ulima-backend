get '/cursos/usuario' do
    # Parámetros
    status = 500
    resp = {
      message: '',
      data: ''
    }
    usuario_id = params[:usuario_id]

  
    # Acceso a la base de datos
    begin
      # Para saber si es rol alumno o profesor
      query2 = <<-STRING
        SELECT rol FROM usuarios
        WHERE id = '#{usuario_id}'
      STRING
  
      resultRol = DB[query2].first
  
      if resultRol && resultRol[:rol] == "alumno"
        # Realizar la consulta SQL con los JOIN y los campos requeridos
        queryCursosAlumnos = <<-STRING
          SELECT UAlum.id AS alumno_id, CUR.nombre AS curso_nombre, SEC.codigo AS seccion_codigo, SEC.profesor_id, UProf.nombres AS profesor_nombres, UProf.apellidos AS profesor_apellidos
          FROM matriculas M
          INNER JOIN usuarios UAlum ON M.alumno_id = UAlum.id
          INNER JOIN secciones SEC ON M.seccion_id = SEC.id
          INNER JOIN cursos CUR ON SEC.curso_id = CUR.id
          INNER JOIN usuarios UProf ON UProf.id = SEC.profesor_id
          WHERE UAlum.id = '#{usuario_id}'
        STRING
  
        result = DB[queryCursosAlumnos].all
  
        # Procesar los resultados
        if result.empty?
          resp[:message] = 'No se encontraron cursos para el alumno especificado.'
        else
          cursos_alumno = result.map do |row|
            {
              alumno_id: row[:alumno_id],
              curso_nombre: row[:curso_nombre],
              seccion_codigo: row[:seccion_codigo],
              profesor_id: row[:profesor_id],
              profesor_nombres: row[:profesor_nombres],
              profesor_apellidos: row[:profesor_apellidos]
            }
          end
          resp[:message] = 'Cursos del alumno obtenidos correctamente.'
          resp[:data] = cursos_alumno
          status = 200
        end
      else

        queryCursosProfe = <<-STRING
            SELECT U.id, C.nombre, SEC.codigo FROM secciones SEC 
            INNER JOIN usuarios U ON SEC.profesor_id = U.id
            INNER JOIN cursos C ON SEC.curso_id = C.id WHERE U.id = '#{usuario_id}';
        STRING

        result2 = DB[queryCursosProfe].all

        if result2.empty?
            resp[:message] = 'No se encontraron cursos para el profesor especificado.'
          else
            cursos_profesor = result2.map do |row|
              {
                profesor_id: row[:id],
                curso_nombre: row[:nombre],
                seccion_codigo: row[:codigo]
              }
            end
            resp[:message] = 'Cursos del profesor obtenidos correctamente.'
            resp[:data] = cursos_profesor
            status = 200
          end
      end
    rescue Sequel::DatabaseError => e
      resp[:message] = 'Error al acceder a la base de datos.'
      resp[:data] = e.message
    rescue StandardError => e
      resp[:message] = 'Error interno del servidor.'
      resp[:data] = e.message
    end
  
    # Respuesta
    status status
    resp.to_json
  end
  