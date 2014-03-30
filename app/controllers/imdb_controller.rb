require 'rubygems'
require 'nokogiri'
require 'open-uri'
class ImdbController < ApplicationController
  
  def index
    @title="this is index of def"

  end
  
  def show
    @title="this is show of def"
    page = params[:page].to_s
        imdburl = "http://www.imdb.com" + page
        doc = Nokogiri::HTML(open(imdburl))
        @titlearray = []
        doc.css("#overview-top , img").each do |titlecss|
        @titlearray << titlecss.inner_html
     end
  end
  
end
