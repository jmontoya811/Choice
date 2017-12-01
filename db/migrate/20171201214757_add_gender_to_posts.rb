class AddGenderToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :gender, :integer, default: 0
  end
end
