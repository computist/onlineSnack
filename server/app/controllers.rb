
require 'json'
require 'securerandom'

Platform::App.controllers  do
  before do
    content_type :json
  end

  get :index do
    status = isLoggedIn
    if status[:login]
      "Suceess"
    else
      "Failed"
    end
  end

   get '/signup' do
      if params[:username] && !params[:username].blank? && params[:password] && !params[:password].blank?
        if !User.find_by_username(params[:username])
          User.create(:username => params[:username], :password => params[:password])
          {status:"success", :username => params[:username]}.to_json
        else
          {status:"Username already exist"}.to_json
        end
      else
        {status:"failed"}.to_json
      end
   end

   get '/login' do
      if params[:username] && !params[:username].blank? && params[:password] && !params[:password].blank?
        @user = User.find_by_username(params[:username])
        if @user && @user.password == params[:password]
          token = p SecureRandom.urlsafe_base64
          session[:username] = params[:username]
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
      
   end

   get '/logout' do
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

   get '/list' do
    spicy = 5
    if params[:spicy] && !params[:spicy].blank?
      value = params[:spicy].to_i
      if value <= 5 && value >= 0
        spicy = value
      end
    end

    if params[:location]
      locations = params[:location].strip.split(",");
      @dishes = Dish.select(:name, :location, :spicy).where("spicy <= ?", spicy).where(location: locations)
    else
      @dishes = Dish.select(:name, :location, :spicy).where("spicy <= ?", spicy)
    end

    @dishes.to_json
   end
end
