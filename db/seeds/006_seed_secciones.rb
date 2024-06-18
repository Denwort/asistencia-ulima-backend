require 'sequel'

DB = Sequel.sqlite('db/app.db')

secciones_data = [
  {
    codigo: '830',
    periodo_id: DB[:periodos].where(nombre: '2024-1').first[:id],
    curso_id: DB[:cursos].where(nombre: 'Programacion movil').first[:id],
    profesor_id: DB[:usuarios].where(usuario: 'profesor').first[:id]
  },
  {
    codigo: '833',
    periodo_id: DB[:periodos].where(nombre: '2024-1').first[:id],
    curso_id: DB[:cursos].where(nombre: 'Taller de propuesta de investigacion').first[:id],
    profesor_id: DB[:usuarios].where(usuario: 'profesor').first[:id]
  },
  {
    codigo: '831',
    periodo_id: DB[:periodos].where(nombre: '2024-1').first[:id],
    curso_id: DB[:cursos].where(nombre: 'Ingenieria de software 2').first[:id],
    profesor_id: DB[:usuarios].where(usuario: 'profesor2').first[:id]
  }
]

secciones_data.each do |seccion|
  DB[:secciones].insert(seccion)
end

puts "Secciones seeded successfully"