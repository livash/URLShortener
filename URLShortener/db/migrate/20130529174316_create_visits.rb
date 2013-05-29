class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |v|
      v.integer :url_id
      v.integer :user_id

      v.timestamps
    end
  end
end
