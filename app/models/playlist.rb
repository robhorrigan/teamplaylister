
class Playlist < ActiveRecord::Base
	belongs_to :party
	belongs_to :user

	attr_accessor :party, :name, :votes
	def initialize(party, name, votes)
		@code = rand(36**5).to_s(36)
	end
end
