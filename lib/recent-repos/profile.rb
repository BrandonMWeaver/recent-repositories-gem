class RecentRepos::Profile
  attr_accessor :name, :contributions
  
  def initialize(document)
    @name = document.css(".p-name").first.text
    @contributions = document.css("h2.f4.text-normal.mb-2")[1].text.split(' ')[0]
  end
end
