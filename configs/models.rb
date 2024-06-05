require_relative 'database'

class Usuario < Sequel::Model(DB[:usuarios])
    one_to_many :secciones, key: :profesor_id
end

class Seccion < Sequel::Model(:secciones)
    many_to_one :usuario, key: :profesor_id
    one_to_many :sesiones
end

class Sesion < Sequel::Model(DB[:sesiones])
    many_to_one :seccion
end

class Asistencia < Sequel::Model(DB[:asistencias])
    many_to_one :usuario, key: :alumno_id
    many_to_one :sesion
end

class Matricula < Sequel::Model(DB[:matriculas])
    many_to_one :usuario, key: :alumno_id
    many_to_one :seccion, key: :seccion_id
end
