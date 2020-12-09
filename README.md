Next Read!

Welcome to Next Read, this is a website where users can create and persist instance of books they have read in a database. Users get to enter a book's name, a review of the book and rate the book.

This code can be run using Shotgun, a user will then start the welcome page where users can sign up to create and account, in their account page they are greeted and then get a table with all their books and the option to edit or delete their own books.

In this build their are 3 controllers, the application controller with two other controllers inheriting the functions from it. The users controller handles the users sign up, log in and log out options. The books controller with it's RESTful routes handles to create, read, update and delete the instances of books.

There are two models; the User class which has many Books, it secures passwords and validates the presence and uniqueness of usernames and passwords. The Book class which belongs to User, it validates the presence and uniqueness of name and review.

There are two folders for views, one for users and one for books, these view files are rendered through the routes.

There are two tables create, one for users and one for books. the database is established in the Environment.rb.

all the gems are required in the gem file which configures Rack and handle the interface with the webserver.