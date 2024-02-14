class HashTag < ApplicationRecord
    belongs_to :quote
    validates :name, presence: true
end
