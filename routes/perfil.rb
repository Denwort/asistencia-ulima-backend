get '/usuario/perfil' do
  usuario_id = params[:usuario_id].to_i

  puts "Recibido usuario_id: #{usuario_id}"

  # Buscar el usuario por ID
  usuario = Usuario.where(id: usuario_id).first

  if usuario
    status 200
    {
      id: usuario.id,
      usuario: usuario.usuario,
      rol: usuario.rol,
      nombres: usuario.nombres,
      apellidos: usuario.apellidos
    }.to_json
  else
    status 404
    { error: 'Usuario no encontrado.' }.to_json
  end
end
