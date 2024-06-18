require 'sequel'

DB = Sequel.sqlite('db/app.db')

DB[:carreras].insert(
  nombre: 'Ingeniería de Sistemas'
)

puts "Carreras seeded successfully"