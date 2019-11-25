require "nokogiri"
require "open-uri"

class RecentRepos::Scraper
  attr_accessor :document
  
  def initialize(url)
    @document = Nokogiri::HTML(open(url))
  end
end
