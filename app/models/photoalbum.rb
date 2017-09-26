class Photoalbum < ApplicationRecord


	has_many :photos, dependent: :destroy

	belongs_to :user

	validates(:title, presence: true)

	mount_uploader :image, ImageUploader
end