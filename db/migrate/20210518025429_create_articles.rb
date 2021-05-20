class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image_id
      t.text :introduction
      t.integer :postal_code, null: false
      t.string :prefecture_code, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :other_address # 番地以降の住所がない場合もあるため、null: falseはつけない
      #マップ表示
      t.float :latitude #緯度
      t.float :longitude #経度
      t.string :telephone_number
      t.text :url
      t.integer :user_id
      t.timestamps
    end
  end
end
