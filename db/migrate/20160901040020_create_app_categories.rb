class CreateAppCategories < ActiveRecord::Migration
  def change
    create_table :app_categories do |t|
      t.references :app, index: true
      t.references :category, index: true
    end
    add_index :app_categories, [:app_id, :category_id]
  end
end
