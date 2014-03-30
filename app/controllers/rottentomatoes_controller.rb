require 'rubygems'
require 'nokogiri'
require 'open-uri'

class RottentomatoesController < ApplicationController
    def index
    @title="this is index of def"

  end
  
  def show
    @title="this is show of def"
    page = params[:page].to_s
        rottenurl = "http://www.rottentomatoes.com"+page
        doc = Nokogiri::HTML(open(rottenurl))
        @titlearray = []
        doc.css(".pinterestImage , .critic_consensus, .critic_stats, .right_col, #mobPanel .left_col, #movieSynopsis, .movie_title span").each do |titlecss|
        @titlearray << titlecss.inner_html
     end
  end
end
