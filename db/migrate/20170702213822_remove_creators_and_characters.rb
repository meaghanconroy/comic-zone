class RemoveCreatorsAndCharacters < ActiveRecord::Migration[5.1]
  def up
    remove_column :comics, :creators
    remove_column :comics, :characters
  end
  def down
    add_column :comics, :creators, :string
    add_column :comics, :characters, :string
  end
end
