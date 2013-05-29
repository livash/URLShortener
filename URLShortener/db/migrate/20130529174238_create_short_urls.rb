class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |l|
      l.string :short_url

      l.timestamps
    end
  end
end
