class ShortUrl < ActiveRecord::Base
  attr_accessible :short_url, :user_id, :long_url_id
  has_many :visits
  has_many :users, :through => :visits
  has_one :long_url
  has_many :tag_topics, :through => :taggings
  has_many :taggings

  def visits_count
    self.visits.count
  end

  def uniq_users_count
    self.users.uniq.count
  end

  def count_visits_in_last_n_min(n = 10)
    time_now = Time.now
    time_then = time_now - n * 60
    self.visits.where("created_at > ?", time_then).count
  end
end