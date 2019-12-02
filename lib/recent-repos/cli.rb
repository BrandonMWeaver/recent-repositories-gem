class RecentRepos::CLI
  attr_accessor :profile, :repo
  
  def call
    menu
  end
  
  private
  
  def print_name
    puts "The user's name: #{@profile.name}"
  end
  
  def print_contributions
    puts "#{@profile.contributions} contributions in the last year"
  end
  
  def print_repositories
    if @profile.repositories.size == 0
      puts "This user has no repositories"
    else
      puts "Recent repositories:"
      i = 0
      @profile.repositories.each { |repo|
        print "\t"
        print '0' if i < 9
        puts "#{i += 1}. #{repo}"
      }
    end
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
        begin
          @profile = RecentRepos::Profile.new(RecentRepos::Scraper.new(profile_name))
          if @profile.name != ""
            print_name
          else
            puts "Profile acquired"
          end
        rescue OpenURI::HTTPError
          puts "Profile not found!"
        end
        
      elsif input.downcase == "contributions" && @profile
        print_contributions
        
      elsif input.downcase == "repos" && @profile
        print_repositories
        
      elsif input.split(':')[0].downcase == "open" && @profile
        repo_name = input.split(':')[1].split(' ')[0]
        begin
          @repo = RecentRepos::Repo.new(RecentRepos::Scraper.get_repo_doc(profile_name, repo_name))
          print_messages
        rescue OpenURI::HTTPError
          puts "Repository not found!"
        end
      
      elsif input.downcase == "exit"
        break
        
      else
        puts "Invalid command!"
      end
    end
  end
end
