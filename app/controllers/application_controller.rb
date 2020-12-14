require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV['SECRET']
        register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end 

    def redirect_if_not_logged_in
      flash[:message] = "Please log in!"
      redirect to '/users/login' if !logged_in?
    end

    def redirect_if_not_authorized
      if @book.user != current_user
        flash[:message] = "You are not authorized to do this action!"
        redirect to '/books/error'
      end
    end
  end

end
