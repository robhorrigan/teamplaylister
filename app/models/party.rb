class Party < ActiveRecord::Base
	belongs_to :admin 
	belongs_to :playlist
end
