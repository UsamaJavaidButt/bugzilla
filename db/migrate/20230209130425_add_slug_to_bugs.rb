class AddSlugToBugs < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :slug, :string
    add_index :bugs, :slug, unique: true
  end
end
