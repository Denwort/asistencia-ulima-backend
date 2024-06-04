require 'sequel'
require 'logger'
require 'rake'

DB = Sequel.sqlite('db/app.db')

namespace :db do
  desc "Run migrations"
  task :migrate do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'db/migrations')
  end

  desc "Create the database"
  task :create do
    # Aquí puedes agregar la lógica para crear la base de datos si es necesario.
    # En este caso, SQLite crea la base de datos automáticamente al conectarse.
    puts "Database created (if it didn't already exist)"
  end

  desc "Drop the database"
  task :drop do
    File.delete('db/development.sqlite3') if File.exist?('db/development.sqlite3')
    puts "Database dropped"
  end

  desc "Seed the database"
  task :seed do
    require './db/seeds'
  end
end