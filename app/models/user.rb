class User < ApplicationRecord
    has_and_belongs_to_many :courses
    has_many :tests
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true

    extend FriendlyId
    friendly_id :full_name, use: :slugged

    def full_name
        first_name + ' ' + last_name
    end
end
