class BooksController < ApplicationController
    
    get '/books' do
        @books = Book.all
        erb :'books/index'
    end 

    get '/books/new' do
        #redirect_if_not_logged_in
        binding.pry
        erb :'books/new'
    end

    post '/books' do
        #redirect_if_not_logged_in
        
        book = Book.create(params[:book])
        redirect to "/books"
    end 

    get '/books/:id' do 
        @book = Book.find_by_id(params[:id])
        erb :'books/show'
    end 

    get '/books/:id/edit' do 
        #redirect_if_not_logged_in
        @book = Book.find_by_id(params[:id])
        @user = User.find_by_id(params[:id])
        if @book.user_id == @user.id
        erb :'books/edit'

        else 
        erb :'books/error'
        
        end
    end 

    patch '/books/:id' do 
        #redirect_if_not_logged_in
        if @book.user_id == @user.id
        book = Book.find_by_id(params[:id])
        book.update(params[:book])
        redirect to "/books/#{book.id}"

        else 
        erb :'books/error'

        end
    end

    delete '/books/:id' do 
        #redirect_if_not_logged_in
        if @book.user_id == @user.id
        book = Book.find_by_id(params[:id])
        book.destroy
        redirect to '/books'

        else 
        erb :'books/error'

        end
    end 

end
