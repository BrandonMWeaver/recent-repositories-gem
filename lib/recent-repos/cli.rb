class RecentRepos::CLI
  attr_accessor :profile
  
  def initialize(profile)
    @profile = profile
  end
  
  def print_name
    puts @profile.name
  end
  
  def print_contributions
    puts "#{@profile.contributions} contributions"
  end
end
