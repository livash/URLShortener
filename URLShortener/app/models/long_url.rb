require 'a'
class LongUrl < ActiveRecord::Base
  attr_accessible :long_url
  belongs_to :short_url
end