require 'nokogiri'
require 'open-uri'

class PlayStoreScrapper

  attr_reader :page

  def initialize
    @page = Nokogiri::HTML(open("https://play.google.com/store/apps/top"))
  end

  def process
    categories = page.css('.cluster-container')
    categories.each do |category|
      app_category = create_category(category)
      app_elements = category.css('.card-list .card')
      app_elements.each do |app_element|
        app = create_app(app_category, app_element)
        reviews_page = Nokogiri::HTML(open("https://play.google.com" + app.link))
        rating = reviews_page.css(".main-content .reviews .rating-box .score-container .score")[0].text
        app.update_attributes(rating: rating.to_f)
        user_reviews = reviews_page.css(".main-content .featured-review")
        user_reviews.each do |user_review|
          user_name = user_review.css('.author-name').text.strip
          user_message = user_review.css('.quoted-review').text.strip
          app.reviews.create(user_name: user_name, message: user_message)
        end
      end
    end
  end

  def create_category(category)
    category_name = category.css('.single-title-link .id-track-click')[0].text
    category = Category.find_or_create_by(name: category_name)
    category
  end

  def create_app(app_category, app_element)
    link = app_element.css('.card-content .card-click-target')[0]['href']
    image_url = app_element.css('.card-content .cover .cover-image-container .cover-image')[0]['src']
    name = app_element.css('.card-content .details .title')[0]['title']
    description = app_element.css('.card-content .details .description')[0].text.strip
    app = App.find_or_create_by(name: name, link: link)
    app.update_attributes(description: description, image_url: image_url)
    app_category.app_categories.find_or_create_by(app: app)
    app
  end

end
