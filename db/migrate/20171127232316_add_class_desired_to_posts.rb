class AddClassDesiredToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :class_desired, :string
  end
end
