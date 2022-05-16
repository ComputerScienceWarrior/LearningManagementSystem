class Question < ApplicationRecord
    belongs_to :test
    
    extend FriendlyId
    friendly_id :header, use: :slugged
end
