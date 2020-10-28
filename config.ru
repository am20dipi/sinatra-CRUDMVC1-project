
require './config/environment'


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end



use Rack::MethodOverride #middleware, override a post request and hijack it and use it for patch
use NailPolishesController
use UsersController
use SessionsController

run ApplicationController