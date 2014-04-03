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
          doc.css('body').remove

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
