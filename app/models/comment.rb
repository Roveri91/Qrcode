class Comment < ApplicationRecord
  belongs_to :profile, dependent: :destroy
  belongs_to :article, dependent: :destroy

  scope :search, ->(term) {
    where("LOWER(content) LIKE ?", "%#{term.downcase}%")
  }
end
