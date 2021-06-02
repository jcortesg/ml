# Xmen

### Intalación
_Se asume que el equipo tiene intalado ruby > 2.5_

##### Intalación de dependencias

`bundle exec bundle install`

##### Creación de bases de datos

`RACK_ENV=development bundle exec rake db:create`
`RACK_ENV=development bundle exec rake db:migrate`

`RACK_ENV=test bundle exec rake db:create`
`RACK_ENV=test bundle exec rake db:migrate`

##### Iniciar servidor

`RACK_ENV=development rackup config.ru`

##### Pruebas

`rspec specs`

