class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.string :publisher, null: false
      t.string :title, null: false
      t.string :creators
      t.string :characters
      t.string :photo
      t.string :keywords
      t.boolean :ongoing, default: true
    end
  end
end
