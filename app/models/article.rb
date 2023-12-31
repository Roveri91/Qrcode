class Article < ApplicationRecord
  belongs_to :profile

  validates :title, presence: true, uniqueness: { scope: :profile_id }
  validates :title, presence: true
  validates :content, presence: true
  validates :profile, presence: true
end
