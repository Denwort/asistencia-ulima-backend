require 'sequel'

DB = Sequel.sqlite('db/app.db')

DB[:periodos].insert(
  nombre: '2024-1'
)

puts "Periodos seeded successfully"