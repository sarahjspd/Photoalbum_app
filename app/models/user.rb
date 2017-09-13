class User < ApplicationRecord

	has_many :photoalbums

	has_many :comments

end