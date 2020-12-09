class UsersController < ApplicationController
    
    get '/users/signup' do 
        erb :'users/signup'
    end 

    post '/users/signup' do 
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else 
            @errors = user.errors.full_messages
            erb :'users/signup'
        end 
    end 

    get '/users/login' do 
        erb :'users/login'
    end

    get '/users/logout' do 
        session.clear
        redirect to '/users/login'
    end 

    post '/users/login' do 
       
        !params[:user][:username].blank? ? user = User.find_by_username(params[:user][:username]) : user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else 
            flash[:message] = "Login unsuccessful. Please try again."
            redirect to '/users/login'
        end
    end 

    get '/users/:id' do 
        @user = User.find_by_id(params[:id])
        @books = Book.all
        erb :'users/account'
    end
end