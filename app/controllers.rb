require 'json'
require 'securerandom'

Platform::App.controllers  do

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
REQUEST_SUCCESS = 0

USER_ALREADY_EXIST = 1
INVALID_EMAIL = 2
PASSWORD_COMPLEXITY_ISSUE = 3
FAILED = 4

WRONG_PASSWORD = 1
INVALID_INPUT = 2

HAVENT_LOG_IN = 1
REQUEST_FAILED = 1
PARTIAL_SUCCESS = 2

  get :index do
      response.set_cookie('XSRF-TOKEN',
                          :path => '/',
                          :value => session[:csrf],
                          :expires => Time.now + 3600*24) if session[:csrf]
      render 'index'
  end

   post :signup, :provides => :json do
      data = JSON.parse(request.body.read)
      if data
	email = data["email"].downcase
        password = data["password"]
	first_name = data["first_name"]
	last_name = data["last_name"]

        if email && !email.blank? && password && !password.blank? && first_name && !first_name.blank? && last_name && !last_name.blank?
          if !User.find_by_email(email)
            #if VALID_EMAIL_REGEX.match(email) && password.length >= 8 && password.length <= 20 && /[A-Z]/.match(password) && /[a-z]/.match(password) && /[0-9]/.match(password)
	  if VALID_EMAIL_REGEX.match(email) && password.length >= 8 && password.length <= 20 && (/[A-Z]/.match(password) || /[a-z]/.match(password)) && /[0-9]/.match(password)
              User.create(:email => email, :password => password, :first_name => first_name, :last_name => last_name)
              {status:REQUEST_SUCCESS, :email => email}.to_json
            elsif !VALID_EMAIL_REGEX.match(email)
	      {status:INVALID_EMAIL}.to_json
	    else
	      {status:PASSWORD_COMPLEXITY_ISSUE}.to_json
	    end
          else
            {status:USER_ALREADY_EXIST}.to_json
          end
        else
          {status:FAILED}.to_json
        end
     else
       {status:FAILED}.to_json
     end
   end

   post :login, :provides => :json do
      data = JSON.parse(request.body.read)
      if data
        email = data["email"].downcase
        password = data["password"]
        if email && !email.blank? && password && !password.blank?
          @user = User.find_by_email(email)
          if @user && @user.password == password
            token = p SecureRandom.urlsafe_base64
            session[:email] = email
            session[:access_token] = token
            @user.access_token = token
            @user.access_token_create_time = Time.now
            @user.save
            {status:REQUEST_SUCCESS, access_token: token}.to_json
          else
            {status:WRONG_PASSWORD}.to_json
          end
        else
          {status:INVALID_INPUT}.to_json
        end
      else
        {status:FAILED}.to_json
      end
   end

   get :logout, :provides => :json do
      if isLoggedIn[:login]
        @user = User.find_by_email(session[:email])
        @user.access_token = nil
        @user.access_token = nil
        @user.save
        session.clear
        {status:REQUEST_SUCCESS}.to_json
      else
        session.clear
        {status:HAVENT_LOG_IN}.to_json
      end
   end

   get :list, :provides => :json do
       @dishes = Dish.select(:id, :name, :store_name, :cuisine, :rate, :price, :reserve, :deliver, :img_s)
    
    if params[:name]
      @dishes = @dishes.where('name LIKE ?', '%'+params[:name]+'%')
    end

    if params[:cuisine]
      cuisines = params[:cuisine].strip.split(",")
      @dishes = @dishes.where(cuisine: cuisines)
    end
    
    if params[:reserve]
        if(params[:reserve].to_i == 1)
            @dishes = @dishes.where(:reserve => true)
        elsif (params[:reserve].to_i == 0)
	    @dishes = @dishes.where(:reserve => false)
	end
    end
    
    if params[:deliver]
        if(params[:deliver].to_i == 1)
            @dishes = @dishes.where(:deliver => true)
	elsif (params[:deliver].to_i == 0)
	    @dishes = @dishes.where(:deliver => false) 
        end
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
    else
	@dishes = @dishes.limit(15)
    end
    
    @dishes.to_json
   end

   get :details, :provides => :json do
	if params[:id] && !params[:id].blank? && Dish.find_by_id(params[:id])
		Dish.select(:id, :name, :cuisine, :spicy, :rate, :rate_number, :price, :deliver, :pickup, :img_l, :img_m, :img_s).find_by_id(params[:id]).to_json
	else
		{}.to_json
	end
   end

   get :getorders, :provides => :json do
	status = isLoggedIn
	if status[:login]
		Order.where(:user_id => status[:user_id]).to_json
	else
		{status:FAILED}.to_json
	end
   end

   get :order, :provides => :json do
	status = isLoggedIn
	if status[:login] && params[:order] && !params[:order].blank?
		#need validate order format
		validOrder, success, failed = validateCart(params[:order]).strip
		if validOrder.length > 0 && failed == 0 && success > 0
			Order.create(:user_id => status[:user_id], :items => validOrder)
			{status:REQUEST_SUCCESS}.to_json
		else
			{status:FAILED, valid: success, invalid: failed}.to_json
		end
	else
		{status:FAILED}.to_json
	end
   end

   get :cuisines, :provides => :json do
	Dish.select(:cuisine).uniq.to_json
   end
   
   get :updatecart, :provides => :json do
	status = isLoggedIn
        if status[:login] && params[:cart]
		validCart, success, failed = validateCart(params[:cart])	
		user = User.find_by_email(session[:email])
		user.cart = validCart
		user.save
		{status:REQUEST_SUCCESS}.to_json
	else
		{status:REQUEST_FAILED}.to_json
	end
   end

   get :getcart, :provides => :json do
	status = isLoggedIn
        if status[:login]
                user = User.find_by_email(session[:email])
		{status:REQUEST_SUCCESS, cart:user.cart}.to_json
        else
		{status:REQUEST_FAILED}.to_json
	end
   end

end
