require 'sequel'

DB = Sequel.sqlite('db/app.db')

DB[:niveles].insert(
  nombre: 1
)

DB[:niveles].insert(
  nombre: 2
)

DB[:niveles].insert(
  nombre: 3
)

DB[:niveles].insert(
  nombre: 4
)

DB[:niveles].insert(
  nombre: 5
)

DB[:niveles].insert(
  nombre: 6
)

DB[:niveles].insert(
  nombre: 7
)

DB[:niveles].insert(
  nombre: 8
)

DB[:niveles].insert(
  nombre: 9
)

DB[:niveles].insert(
  nombre: 10
)

puts "Niveles seeded successfully"