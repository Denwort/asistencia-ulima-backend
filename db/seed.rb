require 'sequel'
require 'logger'

DB = Sequel.sqlite('db/app.db', loggers: [Logger.new($stdout)])

# Lista de seeders en el orden en que deben ejecutarse
seed_files = Dir['db/seeds/*.rb'].sort

# Ejecuta cada seeder
seed_files.each do |seed_file|
  load seed_file
end

puts "All seeders executed successfully"