class Course < ApplicationRecord
    has_many_and_belongs_to :users
    has_many :tests
end
