require 'sequel'
require 'logger'

DB = Sequel.sqlite('db/app.db', loggers: [Logger.new($stdout)])
Sequel.extension :migration

# Ejecuta todas las migraciones en el directorio db/migrations
Sequel::Migrator.run(DB, 'db/migrations')

puts "Migrations applied successfully"