Instrucciones:

1. Instalar Ruby

https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.2.4-1/rubyinstaller-devkit-3.2.4-1-x64.exe

2. Instalar bundler

        gem install bundler

3. Instalar dependencias

        bundler install

4. Ejecutar la aplicación

        ruby main.rb

## Migraciones

1. Crear una nueva migracion en /db/migrations

2. Ejecutar ruby db/migrate.rb

*En caso de error, eliminar el archivo /db/app.db