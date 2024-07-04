get '/curso/alumno' do
  status = 500
  usuario_id = params[:usuario_id]

  begin
    query2 = <<-STRING
      SELECT rol FROM usuarios
      WHERE id = '#{usuario_id}'
    STRING

    resultRol = DB[query2].first
    periodo = PERIODO_ACTUAL

    if resultRol && resultRol[:rol] == "alumno"
      queryCursosAlumnos = <<-STRING
        SELECT UAlum.id AS alumno_id, CUR.nombre AS curso_nombre, SEC.codigo AS seccion_codigo, CUR.color AS color, 
               SEC.profesor_id, UProf.nombres AS profesor_nombres, UProf.apellidos AS profesor_apellidos,
               SEC.id AS secc_id
        FROM matriculas M
        INNER JOIN usuarios UAlum ON M.alumno_id = UAlum.id
        INNER JOIN secciones SEC ON M.seccion_id = SEC.id
        INNER JOIN cursos CUR ON SEC.curso_id = CUR.id
        INNER JOIN usuarios UProf ON UProf.id = SEC.profesor_id
        WHERE UAlum.id = '#{usuario_id}' AND SEC.periodo_id = '#{periodo}'
      STRING

      result = DB[queryCursosAlumnos].all

      cursos_alumno = result.map do |row|
        {
          alumno_id: row[:alumno_id],
          curso_nombre: row[:curso_nombre],
          seccion_codigo: row[:seccion_codigo],
          profesor_id: row[:profesor_id],
          profesor_nombres: row[:profesor_nombres],
          profesor_apellidos: row[:profesor_apellidos],
          color: row[:color],
          secc_id: row[:secc_id]
        }
      end
      status = 200
      cursos_alumno.to_json
    else
      status 404
      { error: "Usuario no encontrado o no es un alumno" }.to_json
    end
  rescue Sequel::DatabaseError => e
    status 500
    { error: e.message }.to_json
  rescue StandardError => e
    status 500
    { error: e.message }.to_json
  end
end

get '/curso/profesor' do
  status = 500
  usuario_id = params[:usuario_id]

  begin
    query2 = <<-STRING
      SELECT rol FROM usuarios
      WHERE id = '#{usuario_id}'
    STRING

    resultRol = DB[query2].first
    periodo = PERIODO_ACTUAL

    if resultRol && resultRol[:rol] == "profesor"
      queryCursosProfe = <<-STRING
        SELECT U.id, C.nombre, SEC.codigo, C.color AS color, SEC.id AS secc_id 
        FROM secciones SEC 
        INNER JOIN usuarios U ON SEC.profesor_id = U.id
        INNER JOIN cursos C ON SEC.curso_id = C.id 
        WHERE U.id = '#{usuario_id}' AND SEC.periodo_id = '#{periodo}'
      STRING

      result2 = DB[queryCursosProfe].all

      cursos_profesor = result2.map do |row|
        {
          profesor_id: row[:id],
          curso_nombre: row[:nombre],
          seccion_codigo: row[:codigo],
          color: row[:color],
          secc_id: row[:secc_id]
        }
      end
      status = 200
      cursos_profesor.to_json
    else
      status 404
      { error: "Usuario no encontrado o no es un profesor" }.to_json
    end
  rescue Sequel::DatabaseError => e
    status 500
    { error: e.message }.to_json
  rescue StandardError => e
    status 500
    { error: e.message }.to_json
  end
end
