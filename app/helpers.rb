# Helper methods defined here can be accessed in any controller or view in the application

module Platform
  class App
    module Helper
	    def isLoggedIn
	      status = {login: false, message: "haven't loged in"}
	      if session[:email] && !session[:email].blank? && session[:access_token] && !session[:access_token].blank?
	        @user = User.find_by_email(session[:email])
	        if @user  && !@user.access_token.blank? && @user.access_token == session[:access_token]
	          if @user.access_token_create_time < 30.minutes.ago
	            @user.access_token = nil
	            @user.save
	            status[:message] = "session expired"
	          else
	            status[:login] =  true
	            status[:message] = "Logged in"
	            status[:user_id] = @user.id
	          end
	        end
	      end
	      return status
	    end
        
        def validSorterOption(sorter_array)
            options_array = ["name", "cuisine", "spicy", "rate", "rate_number", "price"]
            for i in 0..sorter_array.length-1
                if !options_array.include?(sorter_array[i])
                    return false
                end
            end
            return true
        end
    end

    helpers Helper
  end
end