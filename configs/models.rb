require_relative 'database'

class Usuario < Sequel::Model(DB[:usuarios])
    one_to_many :secciones, key: :profesor_id
end

class Seccion < Sequel::Model(:secciones)
    many_to_one :usuario, key: :profesor_id
    many_to_one :periodos, key: :periodo_id
    many_to_one :cursos, key: :curso_id
    one_to_many :sesiones
end

class Sesion < Sequel::Model(DB[:sesiones])
    many_to_one :seccion
end

class Asistencia < Sequel::Model(DB[:asistencias])
    many_to_one :usuario, key: :alumno_id
    many_to_one :sesion, key:  :sesion_id
    def to_custom_json
        {
          id: id,
          asistio: asistio,
          alumno: {
            id: usuario.id,
            rol: usuario.rol,
            nombres: usuario.nombres,
            apellidos: usuario.apellidos,
            correo: usuario.correo
          },
          sesion: {
            id: sesion.id,
            registro: sesion.registro,
            fechaInicio: sesion.fechaInicio,
            fechaFin: sesion.fechaFin,          
            seccion_id: sesion.seccion_id
          },
          created_at: created_at,
          updated_at: updated_at
        }.to_json
    end
end

class Matricula < Sequel::Model(DB[:matriculas])
    many_to_one :usuario, key: :alumno_id
    many_to_one :seccion, key: :seccion_id
end

class Curso < Sequel::Model(DB[:cursos])
    many_to_one :carrera, key: :carrera_id
    many_to_one :nivel, key: :nivel_id
end

class Carrera < Sequel::Model(DB[:carreras])
    one_to_many :cursos
end

class Nivel < Sequel::Model(DB[:niveles])
    one_to_many :cursos
end 