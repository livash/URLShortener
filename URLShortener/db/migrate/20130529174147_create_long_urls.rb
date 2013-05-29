class CreateLongUrls < ActiveRecord::Migration
  def change
    create_table :long_urls do |l|
      l.string :long_url

      l.timestamps
    end
  end
end
