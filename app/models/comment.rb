class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :article

  scope :search, ->(term) {
    where("LOWER(content) LIKE ?", "%#{term.downcase}%")
  }
end
