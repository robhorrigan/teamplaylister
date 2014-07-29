class PartySong < ActiveRecord::Base
	belongs_to :song
	belongs_to :party
end
