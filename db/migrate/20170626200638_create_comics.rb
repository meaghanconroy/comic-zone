class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.string :publisher, null: false
      t.string :title, null: false
      t.string :creators, array: true
      t.string :characters, array: true
      t.string :photo
      t.string :keywords
      t.boolean :ongoing, default: true
    end
  end
end
