class AddTimeslotsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :timeslot, :integer, default: 0
  end
end
