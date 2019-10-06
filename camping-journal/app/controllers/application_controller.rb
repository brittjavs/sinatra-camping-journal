require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do
  def logged_in?
    !!session[:user_id]
  end
    @user = User.find_by(session[:user_id]) # Returns the object associated with the user id
  

  def current_user
    @camper = Camper.find_by(session[:user_id])
  end

end
