class Book < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :name, :review
    validates_uniqueness_of :name
end