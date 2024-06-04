require 'sequel'

DB = Sequel.sqlite('db/app.db')

DB[:carreras].insert(
  nombre: 'Ingeniería de Sistemas',
  created_at: Time.now,
  updated_at: Time.now
)

puts "Carreras seeded successfully"