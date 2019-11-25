class RecentRepos::CLI
  attr_accessor :scraper
  
  def initialize(scraper)
    @scraper = scraper
  end
  
  def test_print
    puts @scraper.document
  end
end
