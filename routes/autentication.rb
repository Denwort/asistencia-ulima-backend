post '/login' do
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

post '/recuperar' do
    usuario = params['usuario']
    correo = params['correo']
    
    user = Usuario.where(usuario: usuario).first
    if user 
    status 200
    { message: "Se enviará la recuperación al correo #{correo}" }.to_json
    else
    status 401
    { message: 'Usuario o contrasenia incorrectos' }.to_json
     end
 end