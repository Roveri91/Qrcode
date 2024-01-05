class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :article

  scope :search, ->(term) {
    where("LOWER(message) LIKE ?", "%#{term.downncase}%")
  }
end
