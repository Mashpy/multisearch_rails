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
        doc.css("#bodyContent").each do |titlecss|
       titlecss.css('a').each do |anc|
          if anc.attributes['href'].try(:value).present?

            anc.attributes['href'].value = 'http://en.wikipedia.org' + anc.attributes['href'].value
           anc['target'] = '_blank'
          end
        end
        @titlearray << titlecss.inner_html
     end
  end

end
end