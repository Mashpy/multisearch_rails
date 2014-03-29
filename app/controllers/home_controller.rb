require 'open-uri'
class HomeController < ApplicationController
  include Scraper

  def index
    @imdb = []
    @wikipedia = []
    @rtomatoes = []
    if params[:k].present?
      search_imdb(params[:k])
      search_wikipedia(params[:k])
      search_rt(params[:k])
    end
  end



  def proxy_img
    #Proxy route for image to avoid broken images
    url = URI.parse params[:url]
    result = Net::HTTP.get_response(url)
    send_data result.body, type: result.content_type, disposition: 'inline'
  end

end
