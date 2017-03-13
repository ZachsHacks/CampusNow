class Event < ApplicationRecord
	has_many :tags, :through => :event_tags
	has_many :event_tags
	validates :name, presence: true, length: { maximum: 50 }
	validates :description, presence: true

	def self.search(search)
		if search
			self.where(['name LIKE ?', "%#{search}%"]).take(50)
		else
			self.all.take(50)
		end
	end




end
