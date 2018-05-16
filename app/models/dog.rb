class Dog < ApplicationRecord
	belongs_to :adopter, class_name: "User", optional: true

	belongs_to :publisher, class_name: "User"
	
	has_one_attached :image

	enum gender: [ :male, :female ]
end
