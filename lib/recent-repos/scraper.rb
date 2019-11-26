require "nokogiri"
require "open-uri"

class RecentRepos::Scraper
  attr_accessor :documents
  
  def initialize(profile_name)
    @documents = {}
    @documents[:profile] = get_profile_doc(profile_name)
    @documents[:repositories] = get_repos_doc(profile_name)
  end
  
  private
  
  def get_profile_doc(profile_name)
    return Nokogiri::HTML(open("https://github.com/#{profile_name}"))
  end
  
  def get_repos_doc(profile_name)
    return Nokogiri::HTML(open("https://github.com/#{profile_name}?tab=repositories"))
  end
end
