require "nokogiri"
require "open-uri"

class RecentRepos::Scraper
  def self.get_profile(profile)
    document = Nokogiri::HTML(open("https://github.com/#{profile}"))
    return document
  end
end
