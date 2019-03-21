require_relative "./app.rb"

p ENV['SPEEDY_SERVICE_DB_URL']

ActiveRecord::Base.establish_connection(ENV['SPEEDY_SERVICE_DB_URL'])

run Services
