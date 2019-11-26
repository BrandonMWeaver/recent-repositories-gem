class RecentRepos::Profile
  attr_accessor :name, :contributions, :repositories
  
  def initialize(scraper)
    @name = scraper.documents[:profile].css("span.p-name.vcard-fullname.d-block.overflow-hidden").text
    @contributions = scraper.documents[:profile].css("h2.f4.text-normal.mb-2")[1].text.split(' ')[0]
    
    @repositories = []
    scraper.documents[:repositories].css("div.d-inline-block.mb-1 h3 a").each { |repo|
      @repositories << repo.text.split(' ')[0]
    }
  end
end
