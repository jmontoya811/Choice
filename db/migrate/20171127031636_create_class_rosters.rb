class CreateClassRosters < ActiveRecord::Migration[5.1]
  def change
    create_table :class_rosters do |t|
      t.string :title
      t.string :subtitle
      t.integer :count
      t.text :description

      t.timestamps
    end
  end
end
