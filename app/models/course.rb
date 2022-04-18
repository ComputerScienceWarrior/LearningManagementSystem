class Course < ApplicationRecord
    has_many_and_belongs_to :users
    has_many :tests

    validates :title, uniqueness: true

    extend FriendlyId
    friendly_id :title, use: :slugged
end
