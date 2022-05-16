class Test < ApplicationRecord
    belongs_to :course
    belongs_to :user
    has_many :questions

    validates :title, uniqueness: true

    extend FriendlyId
    friendly_id :title, use: :slugged
end
