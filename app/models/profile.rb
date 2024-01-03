class Profile < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :qrcode, dependent: :destroy
  has_many :articles, dependent: :destroy

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

  # def generate_qrcode

  #   host = Rails.application.config.action_controller.default_url_options[:host]

  #   qrcode = RQRCode::QRCode.new(profile_url(self, host:))

  #   png = qrcode.as_png(
  #     bit_depth: 1,
  #     border_modules: 4,
  #     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
  #     color: "black",
  #     file: nil,
  #     fill: "white",
  #     module_px_size: 6,
  #     resize_exactly_to: false,
  #     resize_gte_to: false,
  #     size: 120
  #   )

  #   self.qrcode.attach(
  #     io: StringIO.new(png.to_s),
  #     filename: "qrcode.png",
  #     content_type: "image/png"
  #   )

  # end
end
