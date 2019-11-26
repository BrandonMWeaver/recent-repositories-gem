class RecentRepos::Profile
  attr_accessor :name, :contributions, :repositories
  
  def initialize(scraper)
    @name = scraper.documents[:profile].css(".p-name").first.text
    @contributions = scraper.documents[:profile].css("h2.f4.text-normal.mb-2")[1].text.split(' ')[0]
    
    @repositories = []
    scraper.documents[:repositories].css("div.d-inline-block h3").each { |repo|
      @repositories << repo.text.split(' ')[0]
    }
  end
end
