require 'sequel'

DB = Sequel.sqlite('db/app.db')

DB[:periodos].insert(
  nombre: '2024-1',
  created_at: Time.now,
  updated_at: Time.now
)

puts "Periodos seeded successfully"