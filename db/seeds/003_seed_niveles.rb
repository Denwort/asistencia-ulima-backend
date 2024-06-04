require 'sequel'

DB = Sequel.sqlite('db/app.db')

DB[:niveles].insert(
  nombre: 1,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 2,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 3,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 4,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 5,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 6,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 7,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 8,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 9,
  created_at: Time.now,
  updated_at: Time.now
)

DB[:niveles].insert(
  nombre: 10,
  created_at: Time.now,
  updated_at: Time.now
)

puts "Niveles seeded successfully"