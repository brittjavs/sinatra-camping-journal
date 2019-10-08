require 'pry'
class CampingTripsController < ApplicationController
    get '/trips' do
        if logged_in?
            @trips = current_user.camping_trips
            erb :"/camping_trips/index"
        else
            redirect to '/login'
        end
    end

    get '/trips/new' do
        if logged_in?
        erb :"/camping_trips/create_trip"
        else
            redirect to '/login'
        end
    end

    post '/trips' do
        if logged_in?
            @trip = CampingTrip.create(params[:trip])
        redirect to "/trips/#{@trip.id}"
        else
            redirect to '/login'
        end
    end

    get '/trips/:id' do
        if logged_in?
            @trip = CampingTrip.find_by(params[:id])
            binding.pry
            if @trip.camper_id == current_user.id
                erb :"/camping_trips/show_trip"
            end
        else
            redirect to '/login'
        end
    end

    get '/trips/:id/edit' do
        if logged_in?
            @trip = CampingTrip.find_by(params[:id])
            if @trip.camper_id == current_user.id
            erb :"/camping_trips/edit_trip"
            end
        else
            redirect to '/login'
        end
    end

    patch '/trips/:id' do
        if logged_in?
        @trip = CampingTrip.find_by(params[:id])
            if current_user.id == @trip.camper_id
                binding.pry
            @trip.update(params)
            redirect to "/trips/#{@trip.id}"
            end
        else
            redirect to '/login'
        end
    end

    delete '/trips/:id' do
        if logged_in?
            binding.pry
            @trip = CampingTrip.find_by(params[:id])
            if @trip.camper_id == current_user.id
                @trip.delete
                redirect to '/trips'
            end
        else
            redirect to '/login'
        end
    end

end
