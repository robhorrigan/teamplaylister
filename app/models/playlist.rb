class Playlist < ActiveRecord::Base
	belongs_to :party
	belongs_to :user

	attr_accessor :name, :party, :votes, :code
end
