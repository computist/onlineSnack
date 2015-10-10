require 'json'
require 'securerandom'

Platform::App.controllers  do
#  before do
#    content_type :json
#  end

  get :index do
      response.set_cookie('XSRF-TOKEN',
                          :path => '/',
                          :value => session[:csrf],
                          :expires => Time.now + 3600*24) if session[:csrf]
      render 'index'
  end
  
  get '/test' do
      status = isLoggedIn
      if status[:login]
          "Suceess"
          else
          "Failed"
      end
  end

   post '/signup', :provides => :json do
      data = JSON.parse(request.body.read)
      if data
        username = data["username"]
        password = data["password"]
        if username  && !username.blank? && password && !password.blank?
          if !User.find_by_username(username)
            User.create(:username => username, :password => password)
            {status:"success", :username => username}.to_json
          else
            {status:"Username already exist"}.to_json
          end
        else
          {status:"failed1"}.to_json
        end
     else
       {status:"failed2"}.to_json
     end
   end

   post '/login', :provides => :json do
      data = JSON.parse(request.body.read)
      if data
        username = data["username"]
        password = data["password"]
        if username  && !username.blank? && password && !password.blank?
          @user = User.find_by_username(username)
          if @user && @user.password == password
            token = p SecureRandom.urlsafe_base64
            session[:username] = username
            session[:access_token] = token
            @user.access_token = token
            @user.access_token_create_time = Time.now
            @user.save
            {status:"login success", access_token: token}.to_json
          else
            {status:"login failed"}.to_json
          end
        else
          {status:"login failed"}.to_json
        end
      else
        {status:"login failed"}.to_json
      end
   end

   get '/logout', :provides => :json do
      if isLoggedIn[:login]
        @user = User.find_by_username(session[:username])
        @user.access_token = nil
        @user.access_token = nil
        @user.save
        session.clear
        {status:"logout successfully"}.to_json
      else
        session.clear
        {status:"Haven't log in"}.to_json
      end
   end

   get '/list', :provides => :json do
    @dishes = Dish.select(:id, :name, :store_name, :cuisine, :rate, :price, :img_s)
    
    if params[:cuisine]
      cuisines = params[:cuisine].strip.split(",")
      @dishes = @dishes.where(cuisine: cuisines)
    end
    
    sort_string = ""
    if params[:sort_asc] && !params[:sort_asc].blank?
      sorter_asc = params[:sort_asc].strip.split(",")
      if validSorterOption(sorter_asc)
          for i in 0..sorter_asc.length-1
             sort_string = sort_string + sorter_asc[i] + " asc,"
          end
      end
    end
    
    if params[:sort_desc] && !params[:sort_desc].blank?
        sorter_desc = params[:sort_desc].strip.split(",")
        if validSorterOption(sorter_desc)
            for i in 0..sorter_desc.length-1
                sort_string = sort_string + sorter_desc[i] + " desc,"
            end
        end
    end
    
    if sort_string.length > 7
        if sort_string[sort_string.length-1] == ","
            sort_string = sort_string[0..sort_string.length-2]
        end
    end
    
    if sort_string.length > 7
        @dishes = @dishes.order(sort_string)
    end

    if params[:start_item] && !params[:start_item].blank? && params[:end_item] && !params[:end_item].blank? 
      start_item = params[:start_item].to_i
      end_item = params[:end_item].to_i
      if start_item > 0 && end_item > 0 && end_item > start_item
        @dishes = @dishes.offset(start_item-1).limit(end_item - start_item + 1)
      end
    end
    
    @dishes.to_json
   end

   get '/details', :provides => :json do
	if params[:id] && !params[:id].blank? && Dish.find_by_id(params[:id])
		Dish.select(:id, :name, :cuisine, :spicy, :rate, :rate_number, :price, :deliver, :pickup, :img_l, :img_m, :img_s).find_by_id(params[:id]).to_json
	else
		{}.to_json
	end
   end

#******************************Angular JS Link *****************************
    get '/navBar.html' do
      send_file File.join(settings.public_folder, 'views/navBar.html')
    end

end
