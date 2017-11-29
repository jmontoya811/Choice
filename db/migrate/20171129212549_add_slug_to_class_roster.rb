class AddSlugToClassRoster < ActiveRecord::Migration[5.1]
  def change
    add_column :class_rosters, :slug, :string
    add_index :class_rosters, :slug, unique: true
  end
end
