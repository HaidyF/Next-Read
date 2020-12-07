class BooksController < ApplicationController
    
    get '/books' do
        @books = Book.all
        erb :'books/index'
    end 

    get '/books/new' do
        redirect_if_not_logged_in
    # binding.pry
        erb :'books/new'
    end

    post '/books' do
        redirect_if_not_logged_in
        
        book = Book.create(params[:book])
        redirect to "/books"
    end 

    get '/books/:id' do 
        @book = Book.find_by_id(params[:id])
        erb :'books/show'
    end 

    get '/books/:id/edit' do 
        redirect_if_not_logged_in

        current_book = Book.find_by_id(params[:id])
        current_book.each do |c|
        if c.user_id == current_user.id
        erb :'books/edit'

        else 
        erb :'books/error'
        
        end
    end 

    patch '/books/:id' do 
        redirect_if_not_logged_in

        current_book = Book.find_by_id(params[:id])
        current_book.each do |c|
        if c.user_id == current_user.id
        c.update(params[:book])
        redirect to "/books/#{book.id}"

        else 
        erb :'books/error'
        end
        end
    end

    # delete '/books/:id/delete' do 
    #     redirect_if_not_logged_in

    #     books = Book.all
    #     books.each do |b|

    #     if b.user_id == current_user.id
    #     b.destroy
    #     redirect to '/books'

    #     else 
    #     erb :'books/error'
    #     end
    #     end

    #     if current_user
    #         current_user.destroy
    #         session.clear
    #         flash[:message] = "You have successfully deleted your account!"
        
    #     else redirect to '/'
    #     end
     end

end
