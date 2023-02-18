class Book < ApplicationRecord

  belongs_to :user

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/fakeimage bookers2/no_image.jpg")
　  　image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpg")
    end
    image.variant(resize_to_limit: [width, height])
  end

end
