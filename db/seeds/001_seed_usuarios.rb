require 'sequel'

DB = Sequel.sqlite('db/app.db')

usuarios_data = [
  {
    usuario: 'profesor',
    contrasenia: '',
    rol: 'profesor',
    nombres: 'Pepe',
    apellidos: 'Valdivia',
    correo: 'pepe@gmail.com'
  },
  {
    usuario: 'profesor2',
    contrasenia: '',
    rol: 'profesor',
    nombres: 'Hernan',
    apellidos: 'Nina',
    correo: 'nina@gmail.com'
  },
  {
    usuario: 'alumno',
    contrasenia: '',
    rol: 'alumno',
    nombres: 'Mateo',
    apellidos: 'Alvarez',
    correo: '20212407@aloe.ulima.edu.pe'
  },
  {
    usuario: 'alumno2',
    contrasenia: '',
    rol: 'alumno',
    nombres: 'Cliff',
    apellidos: 'de la Cruz',
    correo: 'cliff@gmail.com'
  }
]

usuarios_data.each do |usuario|
  DB[:usuarios].insert(usuario)
end

puts "Usuarios seeded successfully"