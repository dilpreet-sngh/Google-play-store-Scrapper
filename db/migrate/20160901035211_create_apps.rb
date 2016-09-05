class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name, unique: true
      t.string :link
      t.string :image_url
      t.text :description
      t.decimal :rating, scale: 2, precision: 6
    end
  end
end
