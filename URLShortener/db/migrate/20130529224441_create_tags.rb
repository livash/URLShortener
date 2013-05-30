class CreateTags < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :topic
    end

    create_table :taggings do |ts|
      ts.integer :short_url_id
      ts.integer :tag_topic_id
      ts.integer :user_id
    end
  end
end
