class ChangeUsersLongUrlsShortUrls < ActiveRecord::Migration
  def change
    change_table :users do |u|
      u.string :email
    end

    change_table :long_urls do |l|
      l.integer :short_url_id
    end

    change_table :short_urls do |s|
      s.integer :user_id
    end
  end
end
