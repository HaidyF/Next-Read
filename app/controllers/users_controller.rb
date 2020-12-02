class UsersController < ApplicationController
    
    get '/signup' do 
        erb :'users/signup'
    end 

    post '/signup' do 
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else 
            @errors = user.errors.full_messages
            erb :'users/signup'
        end 
    end 

    get '/login' do 
        erb :'users/login'
    end

    get '/logout' do 
        session.clear
        redirect to '/login'
    end 

    post '/signin' do 
        !params[:user][:username].blank? ? user = User.find_by_username(params[:user][:username]) : user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else 
            flash[:message] = "Login unsuccessful. Please try again."
            redirect to '/login'
        end
    end 

    get '/users/:id' do 
        @user = User.find_by_id(params[:id])
        @movies = @user.movies
        erb :'users/account'
    end

end