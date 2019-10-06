require 'pry'
class CampingTripsController < ApplicationController
    get '/trips' do
        if logged_in?
            binding.pry
            @trips = current_user.camping_trips
            erb :"/camping_trips/index"
        else
            redirect to '/login'
        end
    end

    get '/trips/new' do
        erb :"/camping_trips/create_trip"
    end

    post '/trips' do
        redirect to '/trips'
    end

    get '/trips/:id' do
        erb :"/camping_trips/show"
    end

    get '/trips/:id/edit' do
        erb :"/camping_trips/edit_trip"
    end

    patch '/trips/:id' do
        redirect to '/trips/:id'
    end

    delete '/trips/:id' do
        redirect to '/trips/index'
    end

end
