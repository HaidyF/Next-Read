class BooksController < ApplicationController
    
    get '/books' do
        @books = Book.all
        erb :'books/index'
    end 

    get '/books/new' do
        #redirect_if_not_logged_in
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
        erb :'books/edit'
    end 

    patch '/books/:id' do 
        #redirect_if_not_logged_in
        book = Book.find_by_id(params[:id])
        book.update(params[:book])
        redirect to "/books/#{book.id}"
    end

    delete '/books/:id' do 
        redirect_if_not_logged_in
        book = Book.find_by_id(params[:id])
        book.destroy
        redirect to '/books'
    end 

end
