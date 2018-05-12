class User < ApplicationRecord
	has_many :adopted_dogs , class_name: "Dog", foreign_key: "adopter_id"

	has_many :published_dogs , class_name: "Dog", foreign_key: "publisher_id"
end
