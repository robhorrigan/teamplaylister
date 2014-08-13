class Vote < ActiveRecord::Base
  scope :recent, -> { where("created_at > ?", 5.minutes.ago)}

  def vote!(ip)
    unless Vote.recent.exists?(:ip => ip, :party_code => party_code)
      increment!(:votes_up)
      Vote.create(:ip => ip, :party_code => party_code)
    end
  end
end
