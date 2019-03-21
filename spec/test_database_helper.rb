require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'speedy_service_test')
  connection.exec('TRUNCATE users;')
end
