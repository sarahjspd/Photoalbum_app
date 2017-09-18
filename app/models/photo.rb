class Photo < ApplicationRecord

	has_many :comments

	belongs_to :photoalbum

	mount_uploader :image, ImageUploader

end