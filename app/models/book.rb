class Book < ActiveRecord::Base
    belongs_to :reader
    validates_presence_of :name, :review
    validates_uniqueness_of :name
end