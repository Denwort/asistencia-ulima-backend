require 'sequel'

DB = Sequel.sqlite('db/app.db')

def generar_sesiones(seccion_codigo, fechas)
  seccion_id = DB[:secciones].where(codigo: seccion_codigo).first[:id]

  def generar_fechas(inicio, fin, seccion_id, intervalo_dias, repeticiones)
    sesiones = []
    16.times do
      sesiones << {
        registro: false,
        fechaInicio: inicio,
        fechaFin: fin,
        seccion_id: seccion_id
      }
      inicio += intervalo_dias
      fin += intervalo_dias
    end
    sesiones
  end

  sesiones_repetidas = []
  fechas.each do |fecha|
    inicio, fin = fecha
    intervalo_dias = (fin - inicio).to_i == 0 ? 7 : fin - inicio
    sesiones = generar_fechas(inicio, fin, seccion_id, intervalo_dias, 16)
    sesiones_repetidas.concat(sesiones)
  end
  sesiones_repetidas
end

sesiones = []
sesiones.concat(generar_sesiones('830', [
  [DateTime.new(2024, 4, 2, 7), DateTime.new(2024, 4, 2, 9)],
  [DateTime.new(2024, 4, 5, 7), DateTime.new(2024, 4, 5, 10)]
]))
sesiones.concat(generar_sesiones('833', [
  [DateTime.new(2024, 4, 2, 16), DateTime.new(2024, 4, 2, 18)],
  [DateTime.new(2024, 4, 4, 14), DateTime.new(2024, 4, 4, 17)]
]))
sesiones.concat(generar_sesiones('831', [
  [DateTime.new(2024, 4, 1, 14), DateTime.new(2024, 4, 1, 17)],
  [DateTime.new(2024, 4, 3, 14), DateTime.new(2024, 4, 3, 17)]
]))

sesiones.each do |sesion|
  DB[:sesiones].insert(sesion)
end

puts "Sesiones seeded successfully"