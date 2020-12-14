class BooksController < ApplicationController
    
    get '/books' do
        @books = Book.all
        erb :'books/index'
    end 

    get '/books/new' do
        redirect_if_not_logged_in
        erb :'books/new'
    end

    post '/books' do
        redirect_if_not_logged_in
        book = Book.new(params[:book])
        if book.save
        redirect to "/books"
        else 
        @errors = book.errors.full_messages
        erb :'books/new'
        end
    end 

    get '/books/:id' do 
        if @book = Book.find_by_id(params[:id])
            erb :'books/show'
        else
            erb :'books/error'
        end
    end 

    get '/books/:id/edit' do 
        redirect_if_not_logged_in

        @book = Book.find_by_id(params[:id])
        redirect_if_not_authorized
        erb :'books/edit'
    end 

    patch '/books/:id' do 
        redirect_if_not_logged_in
        
        @book = Book.find_by_id(params[:id])
        
        redirect_if_not_authorized

        @book.update(params[:book])
        redirect to "/books/#{@book.id}"

    end

    delete '/books/:id' do 
        redirect_if_not_logged_in
       
        @book = Book.find_by_id(params[:id]) 

        redirect_if_not_authorized
        
        @book.destroy
        redirect to '/books'

     end

     get '/books/error' do

     erb :books/error
    end
end
