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
	
	def validateCart(cartStr)
		cart = cartStr.split("_")
		validCart = ""
		success = 0
		failed = 0
                cart.each do |item|
                        item_info = item.split(":")
                        if item_info.count == 4
                                # valid entry
                                dish = Dish.find_by_id(item_info[0])
                                if dish
                                        if validCart != ""
                                                validCart += "_"
                                        end
                                        validCart += dish.id.to_s + ":" + dish.name + ":" + dish.price.to_s + ":"
                                        if item_info[3].to_i <= 0
                                                validCart += "1"
                                        else
                                                validCart += item_info[3].to_i.to_s
                                        end
					success += 1
					next
                                end
                        end
			failed += 1
                end
		return validCart, success, failed
	end
    end

    helpers Helper
  end
end
