require 'rubygems'
require 'nokogiri'
require 'open-uri'

class WikiController < ApplicationController
  def index
    @title="this is index of def"

  end
  
  def show
    @title="this is show of def"
    page = params[:page].to_s
        wikiurl = "http://en.wikipedia.org" + page
        doc = Nokogiri::HTML(open(wikiurl))
        @titlearray = []
        doc.css("span").each do |titlecss|
        @titlearray << titlecss.text
     end
  end

end
