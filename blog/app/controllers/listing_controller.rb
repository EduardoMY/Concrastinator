class ListingController < ApplicationController 
  def results
    require 'rubygems'
    require 'mechanize'
    agent = Mechanize.new
    page = agent.get('http://google.com')
    page.links.each do |link| # for each link print out the link.
      puts link.text
      @listings = link.text # this is getting re-assigned each time so ends up as last one
      return @listings # returns first item on list 
    end
  end
end