class Profile < ApplicationRecord
  has_one_attached :qrcode, dependent: :destroy
end
