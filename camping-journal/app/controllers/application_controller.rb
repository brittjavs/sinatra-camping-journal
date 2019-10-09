require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "helpfulcampjournal"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end    

    def current_user
      Camper.find_by_id(session[:user_id])
    end

    def visited?
      trips = current_user.camping_trips
        trips.each do |trip|
          if trip.visited == true
            @trip_taken = trip
          end
        end
    end


    def not_visited?
      trips = current_user.camping_trips
        trips.each do |trip|
          if trip.visited == false
            @trip_not_taken = trip
          end
        end
    end
  end

end
