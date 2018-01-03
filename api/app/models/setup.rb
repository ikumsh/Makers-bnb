#require_relative './whatever_we_name_the_model'

DataMapper.setup(:default, "postgres://localhost/mbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
