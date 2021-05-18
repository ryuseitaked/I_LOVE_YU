class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image_id
      t.text :introduction
      t.text :address
      t.string :telephone_number
      t.text :url
      t.integer :user_id
      t.timestamps
    end
  end
end
