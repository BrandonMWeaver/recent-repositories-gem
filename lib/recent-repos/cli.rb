class RecentRepos::CLI
  attr_accessor :profile
  
  def call
    menu
  end
  
  private
  
  def print_name
    puts @profile.name
  end
  
  def print_contributions
    puts "#{@profile.contributions} contributions in the last year"
  end
  
  def print_repositories
    puts "Recent repositories:"
    i = 0
    @profile.repositories.each { |repo|
      print "\t"
      print '0' if i < 9
      puts "#{i += 1}. #{repo}"
    }
  end
  
  def menu
    loop do
      puts "Enter a command:"
      input = gets.strip
      if input.split(':')[0].downcase == "search"
        @profile = RecentRepos::Profile.new(RecentRepos::Scraper.new(input.split(':')[1].split(' ')[0]))
        print_name
      end
      if input.downcase == "contributions" && @profile
        print_contributions
      end
      if input.downcase == "repos" && @profile
        print_repositories
      end
      break if input.downcase == "exit" 
    end
  end
end
