# Helper methods defined here can be accessed in any controller or view in the application

module Platform
  class App
    module Helper
	    def isLoggedIn
	      status = {login: false, message: "haven't loged in"}
	      if session[:username] && !session[:username].blank? && session[:access_token] && !session[:access_token].blank?
	        @user = User.find_by_username(session[:username])
	        if @user  && !@user.access_token.blank? && @user.access_token == session[:access_token]
	          if @user.access_token_create_time < 30.minutes.ago
	            @user.access_token = nil
	            @user.save
	            status[:message] = "session expired"
	          else
	          	puts "success"
	            status[:login] =  true
	            status[:message] = "Logged in"
	          end
	        end
	      end
	      puts status
	      return status
	    end
    end

    helpers Helper
  end
end
