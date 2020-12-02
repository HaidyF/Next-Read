require './config/environment'
require 'sinatra/base'

require_relative 'app/controllers/books_controller'
require_relative 'app/controllers/readers_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
map('/books') { run BooksController }
map('/readers') { run ReadersController }

