class RecentRepos::CLI
  attr_accessor :profile, :repo
  
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
  
  def print_messages
    @repo.commit_messages.each { |message|
      puts "\t#{message}"
    }
  end
  
  def menu
    profile_name = ""
    
    loop do
      puts "Enter a command:"
      input = gets.strip
      
      if input.split(':')[0].downcase == "get"
        profile_name = input.split(':')[1].split(' ')[0]
        @profile = RecentRepos::Profile.new(RecentRepos::Scraper.new(profile_name))
        print_name
      end
      
      if input.downcase == "contributions" && @profile
        print_contributions
      end
      
      if input.downcase == "repos" && @profile
        print_repositories
      end
      
      if input.split(':')[0].downcase == "open" && @profile
        repo_name = input.split(':')[1].split(' ')[0]
        @repo = RecentRepos::Repo.new(RecentRepos::Scraper.get_repo_doc(profile_name, repo_name))
        print_messages
      end
      
      break if input.downcase == "exit" 
    end
  end
end
