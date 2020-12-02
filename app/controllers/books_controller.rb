class BooksController < ApplicationController
    
    get '/all' do
        @books = Book.all
        erb :'books/show'
    end 

    get '/new' do
        # redirect_if_not_logged_in
        erb :'books/new'
    end

    post '/' do
        # redirect_if_not_logged_in
        @book = Book.create(params[:book])
        redirect to "/all"
    end 

    get '/:id' do 
        @book = Book.find_by_id(params[:id])
        erb :'books/show'
    end 

    get '/:id/edit' do 
        # redirect_if_not_logged_in
        @book = Book.find_by_id(params[:id])
        erb :'books/edit'
    end 

    patch '/:id' do 
        # redirect_if_not_logged_in
        book = Book.find_by_id(params[:id])
        book.update(params[:book])
        redirect to "/books/#{@book.id}"
    end

    delete '/:id' do 
        # redirect_if_not_logged_in
        book = Book.find_by_id(params[:id])
        book.destroy
        redirect to '/books'
    end 

end
