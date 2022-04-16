class User < ApplicationRecord
    has_many_and_belongs_to :courses
    has_many :tests
end
