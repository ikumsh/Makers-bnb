require_relative 'models/place'
require_relative 'models/user'
require 'dm-postgres-adapter'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/mbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
