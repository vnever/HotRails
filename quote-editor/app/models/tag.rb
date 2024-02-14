class Tag < ApplicationRecord
  belongs_to :quote

  validates :name, presence: true, uniqueness: { scope: :quote_id }
end
