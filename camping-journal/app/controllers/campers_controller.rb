class CampersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect to '/trips'
        else
        erb :"campers/signup"
        end
    end

    post '/signup' do
        if params[:camper].empty?
            redirect to '/signup'
        else
            @camper = Camper.create(params)
            session[:user_id] = @camper.id
            redirect to '/trips'
        end
    end

    get '/login' do
        erb :"campers/login"
    end

    get '/logout' do
        erb :"campers/logout"
    end
    
end