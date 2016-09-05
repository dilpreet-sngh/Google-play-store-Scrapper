class CrawlersController < ApplicationController

  def create
    PlayStoreScrapper.new.delay.process
    @categories = Category.includes(apps: :reviews).all
  end

  def delete
    Category.delete_all
    App.delete_all
    AppCategory.delete_all
    Review.delete_all
  end

end
