require_relative 'database'

class Level < Sequel::Model(DB[:levels])
end

class User < Sequel::Model(DB[:users])
end