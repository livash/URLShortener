class ChangeLongUrlShortUrl < ActiveRecord::Migration
  def change
    change_table :long_urls do |t|
      t.remove :short_url_id
    end

    change_table :short_urls do |t|
      t.integer :long_url_id
    end
  end
end
