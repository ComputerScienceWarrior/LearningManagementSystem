class User < ApplicationRecord
    has_many_and_belongs_to :courses
    has_many :tests

    extend FriendlyId
    friendly_id :full_name, use: :slugged

    before do
        full_name
    end

    def full_name
        first_name + ' ' + last_name
    end
end
