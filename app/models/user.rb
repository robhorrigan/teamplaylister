class User < ActiveRecord::Base
	# has_many: :parties
	# has_many: :playlists, through: :parties
  
  def self.from_omniauth(auth)
    # where(auth.slice('uid')).first || create_from_omniauth(auth)
    where(auth.slice('uid')).first_or_initialize.tap do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
      user.refresh_token = auth["credentials"]["refresh_token"]
      user.image = auth["info"]["image"]
      user.save
    end 
  end

  # def self.create_from_omniauth(auth)
  #   create! do |user|
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["name"]
  #     user.token = auth["credentials"]["token"]
  #     user.refresh_token = auth["credentials"]["refresh_token"]
  #     user.image = auth["info"]["image"]
  #   end
  # end

end
