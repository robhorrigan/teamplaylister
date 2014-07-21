class Playlist < ActiveRecord::Base
	belongs_to: :party
	belongs_to: :playlist, through: :parties
end
