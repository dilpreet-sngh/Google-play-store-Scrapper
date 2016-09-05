class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.text :message
      t.references :app, index: true
    end
  end
end
