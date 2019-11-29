class RecentRepos::Repo
  attr_accessor :commit_messages
  
  def initialize(scraped_repo)
    @commit_messages = []
    scraped_repo.css("a.message.js-navigation-open").each { |message|
      @commit_messages << message.text
    }
  end
end
