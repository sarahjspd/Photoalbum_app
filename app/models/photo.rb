class Photo < ApplicationRecord

	has_many :comments, dependent: :destroy

	belongs_to :photoalbum

	mount_uploader :image, ImageUploader

	validates(:image, presence: true)

end