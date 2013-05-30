class Tagging < ActiveRecord::Base
  attr_accessible :tag_topic_id, :short_url_id
  belongs_to :short_url
  belongs_to :tag_topic
end
