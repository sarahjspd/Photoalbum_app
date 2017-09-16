class Photo < ApplicationRecord

	has_many :comments

	belongs_to :photoalbum, dependent: :destroy

	mount_uploader :image, ImageUploader

end