require 'pry'
class CampersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect to '/trips'
        else
        erb :"/campers/signup"
        end
    end

    post '/signup' do
            @camper = Camper.create(params[:camper])
            if @camper.save
            session[:user_id] = @camper.id
            redirect to '/trips'
            else
            redirect to "/signup"
        end
    end

    get '/login' do
        if logged_in?
            redirect to '/trips'
        else
        erb :"/campers/login"
        end
    end

    post '/login' do
        @camper = Camper.find_by(username: params[:username])
        if @camper && @camper.authenticate(params[:password])
            session[:user_id] = @camper.id
            redirect to '/trips'
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        if logged_in?
          session.clear
          redirect to '/'
        else
          redirect to '/login'
        end
      end
    
end