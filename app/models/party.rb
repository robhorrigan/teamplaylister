class Party < ActiveRecord::Base
	belongs_to :user 
	belongs_to :playlist

	attr_accessor :name, :user
end
