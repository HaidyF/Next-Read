class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :genre
      t.string :review
      t.float :rating
      t.integer :reader_id
  end
end
