require 'sequel'

DB = Sequel.sqlite('db/app.db')

usuarios_data = [
  {
    usuario: 'profesor',
    contrasenia: '',
    rol: 'profesor',
    nombres: 'Pepe',
    apellidos: 'Valdivia',
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    usuario: 'profesor2',
    contrasenia: '',
    rol: 'profesor',
    nombres: 'Hernan',
    apellidos: 'Nina',
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    usuario: 'alumno',
    contrasenia: '',
    rol: 'alumno',
    nombres: 'Mateo',
    apellidos: 'Alvarez',
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    usuario: 'alumno2',
    contrasenia: '',
    rol: 'alumno',
    nombres: 'Cliff',
    apellidos: 'de la Cruz',
    created_at: Time.now,
    updated_at: Time.now
  }
]

usuarios_data.each do |usuario|
  DB[:usuarios].insert(usuario)
end

puts "Usuarios seeded successfully"