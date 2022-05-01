class Course < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :tests

    validates :title, uniqueness: true

    extend FriendlyId
    friendly_id :title, use: :slugged
end
