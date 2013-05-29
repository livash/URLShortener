class ChangeVisits < ActiveRecord::Migration
  def change
    change_table :visits do |v|
      v.string :comment
    end
  end
end
