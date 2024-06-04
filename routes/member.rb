get '/member/resume' do
  # params
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  member_id = params[:member_id]
  # db access
  begin
    query = <<-STRING
      SELECT 
        (SELECT COUNT(*) FROM exercises_members WHERE member_id = #{member_id}) AS exercises,
        (SELECT COUNT(body_part_id) FROM (
            SELECT E.body_part_id
            FROM exercises_members EM
            INNER JOIN exercises E ON EM.exercise_id = E.id
            WHERE member_id = #{member_id}
            GROUP BY E.body_part_id
        ) AS body_parts_subquery) AS body_parts_count;
    STRING
    record = DB[query].first
    if record then
      resp[:message] = 'Lista de ejercicios'
      resp[:data] = {
        exercises: record[:exercises], # int
        body_parts: record[:body_parts_count], # int
      }
    else
      resp[:message] = 'Usuario aún no cuenta con ejercicios asignados'
    end
    status = 200
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Error no esperado'
    resp[:data] = e.message
  end
  # response
  status status
  resp.to_json
end

get '/member/exercise' do
  # params
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  member_id = params[:member_id]
  exercise_id = params[:exercise_id]
  # db access
  begin
    query = <<-STRING
      SELECT E.id, E.name, EM.sets, EM.reps, E.description, E.video_url FROM exercises_members EM 
      INNER JOIN exercises E ON EM.exercise_id = E.id
      WHERE member_id = #{member_id} AND exercise_id = #{exercise_id};
    STRING
    record = DB[query].first
    if record then
      resp[:message] = 'Datos del ejercicio del miembro'
      resp[:data] = {
        id: record[:id], 
        name: record[:name], 
        description: record[:description], 
        sets: record[:sets], 
        reps: record[:reps], 
        video_url: record[:video_url], 
      }
    else
      resp[:message] = 'Usuario aún no tiene asignado ese ejercicio'
    end
    status = 200
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Error no esperado'
    resp[:data] = e.message
  end
  # response
  status status
  resp.to_json
end

get '/member/exercises' do
  # params
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  member_id = params[:member_id]
  body_part_id = params[:body_part_id]
  # db access
  begin
    query = <<-STRING
      SELECT E.id, E.name, E.image_url, E.video_url, E.description, E.body_part_id, EM.sets, EM.reps FROM exercises_members EM 
      INNER JOIN exercises E ON E.id = EM.exercise_id 
      INNER JOIN body_parts BP ON BP.id = E.body_part_id
      WHERE member_id = #{member_id};
    STRING
    if body_part_id != nil then
      query = query + ` AND body_part_id = #{body_part_id};`
    end
    rs = DB[query]
    # puts query
    if rs then
      resp[:data] = []
      rs.each do |row|
        # Procesar cada fila del resultado y agregarla a resp[:data]
        resp[:data] << {
          id: row[:id],
          name: row[:name],
          image_url: row[:image_url],
          video_url: row[:video_url],
          description: row[:description],
          body_part_id: row[:body_part_id],
          sets: row[:sets],
          reps: row[:reps],
        }
      end
    else
      resp[:message] = 'Usuario aún no tiene asignado ese ejercicio'
    end
    status = 200
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Error no esperado'
    resp[:data] = e.message
  end
  # response
  status status
  resp.to_json
end
