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
        doc.css("body").each do |titlecss|
          doc.xpath('//@style').remove 
          doc.css('#img_primary a , .star-box-rating-widget, #ynd_2745629, #prometer, .star-box-giga-star, #overview-bottom, #titleRecs, .contribute, #boardsTeaser, #titleFAQ, #titleDidYouKnow, #footer, #maindetails_sidebar_bottom, #maindetails_sidebar_bottom .odd, #maindetails_sidebar_bottom .even, .aux-content-widget-2, .subnav, #top_ad_wrapper, #navbar').remove
               
          titlecss.css('a').each do |anc|
          if anc.attributes['href'].try(:value).present?
            anc.attributes['href'].value = 'http://www.imdb.com' + anc.attributes['href'].value
           anc['target'] = '_blank'
          end
        end
        @titlearray << titlecss.inner_html
     end
  end
  
end
