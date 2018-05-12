class Dog < ApplicationRecord
	belongs_to :adopter, class_name: "User", optional: true

	belongs_to :publisher, class_name: "User"

	enum gender: [ :male, :female ]
end
