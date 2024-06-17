class Article < ApplicationRecord
  belongs_to :profile
  has_many :comments, dependent: :destroy

  validates :title, uniqueness: { scope: :profile_id }
  validates :title, presence: true
  validates :content, presence: true

end
