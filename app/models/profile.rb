class Profile < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :qrcode, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :surname, presence: true
  validates :birthday, presence: true
  validates :linkedln, presence: true
  validates :linkedln, uniqueness: { message: "This URL has already taken." }

  validates :linkedln, presence: true, format: { with: %r{\Ahttps://www\.linkedin\.com/in/[a-zA-Z0-9-]+(?:/)?\z}, message: 'is not a valid LinkedIn profile link' }

  # validates :linkedln, presence: true, format: { with: /\Ahttps:\/\/www.linkedin.com\/in\/[a-zA-Z0-9_-]+\z/, message: "ust be a valid LinkedIn URL" }

  # before_commit :generate_qrcode, on: :create

  def fullname
    [name, surname].join(" ")
  end

  private

end
