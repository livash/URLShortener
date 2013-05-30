class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :visits
  has_many :short_urls
  
  validates :name, :email, :presence => true
  validates :name, :length => { :minimum => 2 }
  validates :email, :uniqueness => true
  validates :email, :format => { 
    :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
    :message => "Email format is not correct"
  }

  def links
    self.short_urls
  end

  def comments
    self.visits.map { |visit| visit.comment }.compact
  end
end