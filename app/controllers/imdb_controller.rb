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
          doc.css('#navbar , #quicksearch, #navbar-query, #top_ad_wrapper, #bottom_ad_wrapper, .footer, .aux-content-widget-3').remove
          doc.css(' #prometer').remove
          doc.css('#name-pro-info , #boardsTeaser, .contribute, .see-more, h2, .subnav, .aux-content-widget-2').remove 
          doc.css('.rightcornerlink').remove 
          doc.css('#overview-bottom , .giga-star').remove 
          doc.css('#ynd_557422').remove 
          doc.css('#tn15crumbs , #tn15lhs, #action-box').remove 
          
               
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
