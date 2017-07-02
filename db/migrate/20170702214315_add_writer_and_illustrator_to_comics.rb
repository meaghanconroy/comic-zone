class AddWriterAndIllustratorToComics < ActiveRecord::Migration[5.1]
  def up
    add_column :comics, :writer, :string
    add_column :comics, :artist, :string
  end
  def down
    remove_column :comics, :writer
    remove_column :comics, :artist
  end
end
