class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  # name重複禁止、2‐50字制限
  validates :name, uniqueness: true
  validates :name, numericality: {greater_than: 2, less_than: 20}
  # validates :introduction, length: {muximum: 50}

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/fakeimage bookers2/no_image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpg")
    end
    profile_image.variant(resize_to_limit: [width, height])
  end


end
