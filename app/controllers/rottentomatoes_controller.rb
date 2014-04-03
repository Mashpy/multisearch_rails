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
    doc.css("body").each do |titlecss|
    doc.css('#trailer_play_button , #movie_rating_widget, .col_300, .foot, .col_300 .content_box, #homepagenews, #freshlinks_sidebar, #features_sidebar, #discussionForum, #like_this, #audience_reviews, #contentReviews, #fb-friend-reviews-box, #watch-it-now, #on-dvd, #movies_sidebar a, #head').remove     
    doc.css('#leaderboard_top_ad').remove
    doc.css('.lineHeader , #top-critics-numbers, #top-critics-numbers .tomato_numbers, #critic-links').remove
    doc.css('#trailerModal').remove  
    doc.xpath('//@style').remove  
    titlecss.css('a').each do |anc|
    if "http"==anc.attributes['href'].value[0..3]  || "www"==anc.attributes['href'].value[0..2]
        anc['target'] = '_blank'
    else
        anc.attributes['href'].value = 'http://www.rottentomatoes.com' + anc.attributes['href'].value
        anc['target'] = '_blank'
      end
    end
        @titlearray << titlecss.inner_html
    end
  end
end
