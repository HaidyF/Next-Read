class Createreaders < ActiveRecord::Migration
  def change
    t.string :username
      t.string :email
      t.string :password_digest
      t.integer :book_id
  end
end
