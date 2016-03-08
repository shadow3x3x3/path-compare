require 'mysql2'

# config
Host     = 'localhost'
Username = 'fcu_selab'
Password = '52005505'
Database = 'pathbycar'

def insert_sql(deviceId, longitude, latitude)
  "INSERT INTO `pathbycar`.`location` (`id`, `deviceId`, `longitude`, ` latitude`, `timestamp`) VALUES (NULL, #{deviceId}, #{longitude}, #{latitude}, NULL);"
end

mysqlClient = Mysql2::Client.new(
  :host => Host, :username => Username, :password => Password, :database => Database)
mysqlClient.query(insert_sql(21875, 34094, 3495))


