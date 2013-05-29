class LongUrl < ActiveRecord::Base
  attr_accessible :id, :long_url
  belongs_to :short_url_id
end