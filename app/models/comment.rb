class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :article

  validates :content, presence: true;
  validates :content, length: { in: 10..100 }

  scope :search, ->(term) {
    where("LOWER(content) LIKE ?", "%#{term.downcase}%")
  }
end
