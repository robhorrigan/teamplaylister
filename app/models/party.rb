class Party < ActiveRecord::Base
	before_create :generate_code

	belongs_to :user 
	belongs_to :playlist

	def generate_code
		self.code = rand(36**5).to_s(36)
	end
end
