post '/user/validate' do
  # params
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  user = params[:user]
  password = params[:password]
  # db access
  begin
    # SELECT id, member_id FROM users
    # WHERE user = '#{user}' AND password = '#{password}';
    record = User.where(user: user, password: password).select(:id, :member_id).first
    # result set
    user_id = nil
    member_id = nil
    data = ''
    message = 'Usuario no encontrado'
    if record then
      resp[:message] = 'Usuario encontrado'
      resp[:data] = { 
        user_id: record[:id], 
        member_id: record[:member_id],
      }
      status = 200
    else
      status = 404
      resp[:message] = 'Usuario no encontrado'
    end
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Ocurrió un error no esperado al validar el usuario'
    resp[:data] = e.message
  end
  # response
  status status
  resp.to_json
end

post '/user/reset' do
  # params
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  dni = params[:dni]
  email = params[:email]
  # db access
  begin
    query = <<-STRING
      SELECT U.id AS user_id FROM members M
      INNER JOIN users U ON M.id = U.member_id
      WHERE M.dni='#{dni}' AND M.email = '#{email}';
    STRING
    record = DB[query].first
    if record then
      chars = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      new_password = (0...15).map { chars[rand(chars.length)] }.join
      # UPDATE users SET password='#{new_password}' 
      # WHERE id = #{record[:user_id]};
      User[record[:user_id]].update(password: new_password)
      resp[:message] = 'Contraseña actualizada'
      status = 200
    else
      resp[:message] = 'Usuario no encontrado'
    end
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  end
  # response
  status status
  resp.to_json
end
