# Xmen

### Intalación
_Se asume que el equipo tiene intalado ruby > 2.5_

#### Intalación de dependencias

`bundle exec bundle install`

#### Creación de bases de datos

`RACK_ENV=development bundle exec rake db:create`
`RACK_ENV=development bundle exec rake db:migrate`

`RACK_ENV=test bundle exec rake db:create`
`RACK_ENV=test bundle exec rake db:migrate`

#### Iniciar servidor

`RACK_ENV=development rackup config.ru`

#### Pruebas

`rspec specs`

#### Code coverage


`open coverage/index.html`

`Coverage report generated for RSpec to x-men/coverage. 120 / 129 LOC (93.02%) covered.`
