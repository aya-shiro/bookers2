class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/fakeimage bookers2/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpg")
    end
    image.variant(resize_to_limit: [width, height])
  end

end
