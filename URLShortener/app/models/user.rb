
class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :visits
  has_many :short_urls

  def links
    self.short_urls
  end

  def comments
    self.visits.map { |visit| visit.comment }.compact
  end
end