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
            
           titlecss.css('a').each do |anc|
          if anc.attributes['href'].try(:value).present?
            anc.attributes['href'].value = 'http://www.rottentomatoes.com' + anc.attributes['href'].value
           anc['target'] = '_blank'
          end
        end
        @titlearray << titlecss.inner_html
     end
  end
end
