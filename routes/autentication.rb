require 'sinatra'
require 'mail'
require 'json'
require 'securerandom'

Mail.defaults do
  delivery_method :smtp, {
    address: 'smtp.gmail.com',
    port: 587,
    user_name: 'pogmovil823@gmail.com',
    password: 'xwbj iarq tcqb pvis',
    authentication: 'plain',
    enable_starttls_auto: true
  }
end

get '/login' do
    usuario = params['usuario']
    contrasenia = params['contrasenia']

    user = Usuario.where(usuario: usuario).first
    if user && user.contrasenia == contrasenia
      status 200
      user.to_json
    else
      status 401
      { message: 'Usuario o contrasenia incorrectos' }.to_json
    end
  end

get '/recuperar' do
  usuario = params['usuario']
  
  puts "usuario:"
  puts usuario
  puts "xd:"

  user = Usuario.where(usuario: usuario).first
  if user
    correo = user.correo
    Mail.deliver do
      to correo
      from 'pogmovil823@gmail.com'
      subject 'Recuperación de contraseña'
      body "Hola #{user.nombres},\n\nHemos recibido una solicitud para recuperar tu contraseña. Utiliza el siguiente enlace para restablecer tu contraseña:\n\nhttp://localhost:4567/cambiar_contrasenia?user_id=#{user.id}\n\nSi no solicitaste esta recuperación, por favor ignora este correo."
    end
  
    status 200
    { message: "Se enviará la recuperación al correo #{correo}" }.to_json
  else
    status 401
    { message: 'Usuario o correo incorrectos' }.to_json
  end
end

get '/cambiar_contrasenia' do
  @usuario = params['user_id']
  erb :cambiar_contrasenia
end

post '/cambiar_contrasenia' do

  content_type :json
  data = JSON.parse(request.body.read)
  
  usuario = data['usuario']
  nueva_contrasenia = data['nueva_contrasenia']

  user = Usuario.where(id: usuario).first


  if user
    user.update(contrasenia: nueva_contrasenia)
    status 200
    { message: 'Contraseña cambiada exitosamente' }.to_json
  else
    status 401
    { message: 'Usuario no encontrado' }.to_json
  end

end

__END__

@@cambiar_contrasenia
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cambiar Contraseña</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      padding: 20px;
    }
    .container {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      text-align: center;
      color: #333;
    }
    label {
      display: block;
      margin: 10px 0 5px;
      color: #555;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 8px;
      margin: 5px 0 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #28a745;
      border: none;
      color: white;
      font-size: 16px;
      cursor: pointer;
      border-radius: 4px;
    }
    input[type="submit"]:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Cambiar Contraseña</h1>
    <form action="/cambiar_contrasenia" method="POST">
      <label for="usuario">Usuario</label>
      <input type="text" id="usuario" name="usuario" required>
      
      <label for="nueva_contrasenia">Nueva Contraseña</label>
      <input type="password" id="nueva_contrasenia" name="nueva_contrasenia" required>
      
      <input type="submit" value="Cambiar Contraseña">
    </form>
  </div>
</body>
</html>