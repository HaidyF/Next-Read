require './config/environment'
require 'sinatra/base'

require_relative 'app/controllers/books_controller'
require_relative 'app/controllers/users_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride
use BooksController
use UsersController
run ApplicationController


