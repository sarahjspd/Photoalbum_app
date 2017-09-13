class Photo < ApplicationRecord

	has_many :comments

	belongs_to :photoalbum

end