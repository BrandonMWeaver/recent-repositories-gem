class RecentRepos::CLI
  attr_accessor :profile
  
  def initialize(profile)
    @profile = profile
  end
  
  def print_name
    puts @profile.name
  end
  
  def print_contributions
    puts "#{@profile.contributions} contributions in the last year"
  end
  
  def print_repositories
    puts "Recent repositories:"
    @profile.repositories.each { |repo| puts "\t#{repo}" }
  end
end
