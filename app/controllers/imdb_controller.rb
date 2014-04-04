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
    doc.encoding = 'utf-8'
    @titlearray = []
    doc.css("body").each do |titlecss|
    doc.xpath('//@style').remove 
    doc.css('#img_primary a , .star-box-rating-widget, #ynd_2745629, #prometer, .star-box-giga-star, #overview-bottom, #titleRecs, .contribute, #boardsTeaser, #titleFAQ, #titleDidYouKnow, #footer, #maindetails_sidebar_bottom, #maindetails_sidebar_bottom .odd, #maindetails_sidebar_bottom .even, .aux-content-widget-2, .subnav, #top_ad_wrapper, #navbar').remove
    doc.css('#moka_form .aux-content-widget-3').remove
    doc.css('.injected_slot').remove 
    doc.css('.ellipsis , #combined-photos .loadlate, #titleCast img').remove 
    doc.css('.left , #tn15adrhs, #tn15crumbs, #tn15lhs').remove
    doc.css('#charhelplink a').remove
    doc.css('hr , .rightcornerlink').remove
    doc.css('#knownfor img').remove
    doc.css('.loadlate').remove
     
    titlecss.css('a').each do |anc|
    if anc.attributes['href'].try(:value).present?
     if "http"==anc.attributes['href'].value[0..3]  || "www"==anc.attributes['href'].value[0..2]
         anc['target'] = '_blank'
     else
         anc.attributes['href'].value = 'http://www.imdb.com' + anc.attributes['href'].value
         anc['target'] = '_blank'
     end
   end
   end
     @titlearray << titlecss.inner_html
   end
     doc = Nokogiri::HTML(open(imdburl))
     @imagearray = []
     doc.css("#img_primary").each do |imagecss|
     doc.xpath('//@style').remove 
     doc.css(".text-center").remove

     imagecss.css('img').each do |anc|
if anc.attributes['src'].try(:value).present?
       if anc.attributes['src'].try(:value).present?
          anc.attributes['src'].value = '/proxy_img?url=' + anc.attributes['src'].value
          anc['target'] = '_blank'
       end
    end
end
      @imagearray << imagecss.inner_html
   end
end
  
end
