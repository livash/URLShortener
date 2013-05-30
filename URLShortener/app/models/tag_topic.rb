class TagTopic < ActiveRecord::Base
  attr_accessible :topic
  has_many :short_urls, :through => :taggings
  has_many :taggings

  def most_visited_urls(num = 5)
    top_shorts = self.short_urls.group("short_url_id").limit(num)
  end
end