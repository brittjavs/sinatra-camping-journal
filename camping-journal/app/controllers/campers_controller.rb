class CampersController < ApplicationController

    get '/signup' do
        erb :"campers/signup"
    end

    get '/login' do
        erb :"campers/login"
    end

    get '/logout' do
        erb :"campers/logout"
    end
    
end