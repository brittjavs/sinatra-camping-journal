class CampersController < ApplicationController

    get '/signup' do
        erb :"campers/signup"
    end
end