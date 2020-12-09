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
        
        book = Book.create(params[:book])
        redirect to "/books"
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
        if @book.user_id == current_user.id
        erb :'books/edit'

        else 
        flash[:message] = "Please sign in to your account!"
        erb :'books/error'
        end
    end 

    patch '/books/:id' do 
        redirect_if_not_logged_in
        
        book = Book.find_by_id(params[:id])
        if book.user == current_user
        book.update(params[:book])
        redirect to "/books/#{book.id}"

        else 
        erb :'books/error'
        end
    end

    delete '/books/:id' do 
        redirect_if_not_logged_in
    
        book = Book.find_by_id(params[:id]) 
        if book.user == current_user
            book.destroy
            redirect to '/books'

        else 
            erb :'books/error'
        end
        
     end

end
