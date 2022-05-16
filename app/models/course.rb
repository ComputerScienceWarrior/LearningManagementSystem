class Course < ApplicationRecord
    has_many :tests
    belongs_to :user

    validates :title, uniqueness: true

    extend FriendlyId
    friendly_id :title, use: :slugged
end
