class CampersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect to '/trips'
        else
        erb :"campers/signup"
        end
    end

    post '/signup' do
        if params[:camper].empty? #will need revision, should i check params or validate in model?
            redirect to '/signup'
        else
            @camper = Camper.create(params)
            session[:user_id] = @camper.id
            redirect to '/trips'
        end
    end

    get '/login' do
        if logged_in?
            redirect to '/trips'
        else
        erb :"campers/login"
        end
    end

    post '/login' do
        @camper = Camper.find_by(params[:username])
        if @camper && @camper.authenticate(params[:password])
            session[:user_id] = @camper.id
            redirect to '/trips'
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        erb :"campers/logout"
    end
    
end