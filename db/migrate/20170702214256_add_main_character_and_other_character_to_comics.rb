class AddMainCharacterAndOtherCharacterToComics < ActiveRecord::Migration[5.1]
  def up
    add_column :comics, :main_character, :string
    add_column :comics, :other_characters, :string
  end
  def down
    remove_column :comics, :main_character
    remove_column :comics, :other_characters
  end
end
