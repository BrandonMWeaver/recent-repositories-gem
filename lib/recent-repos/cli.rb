class RecentRepos::CLI
  attr_accessor :scraper
  
  def initialize(scraper)
    @scraper = scraper
  end
  
  def test_print
    puts @scraper.document.css(".p-name").text
  end
end
