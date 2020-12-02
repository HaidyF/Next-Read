class CreateBooks < ActiveRecord::Migration
  def change
        drop_table :books
        create_table :books do |t|
          t.string :name
          t.string :genre
          t.string :review
          t.float :rating
          t.integer :user_id
        end
  end
end
