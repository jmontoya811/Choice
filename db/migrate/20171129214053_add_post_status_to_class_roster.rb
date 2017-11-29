class AddPostStatusToClassRoster < ActiveRecord::Migration[5.1]
  def change
    add_column :class_rosters, :status, :integer, default: 0
  end
end
