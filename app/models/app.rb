class App < ActiveRecord::Base

  has_many :app_categories
  has_many :categories, through: :app_categories
  has_many :reviews

end
