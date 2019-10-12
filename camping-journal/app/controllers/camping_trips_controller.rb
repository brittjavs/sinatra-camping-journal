require 'pry'
class CampingTripsController < ApplicationController
    get '/trips' do
        if logged_in?
            @trips = current_user.camping_trips.where(visited: true)
            @bucketlist = current_user.camping_trips.where(visited: false)
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
            @trip.camper_id = current_user.id
                if @trip.save
                redirect to "/trips/#{@trip.id}"
                else
                redirect to "/trips/new"
                end
        else
            redirect to '/login'
        end
    end

    get '/trips/:id' do
        if logged_in?
            @trip = CampingTrip.find_by_id(params[:id])
            if @trip.camper_id == current_user.id
                erb :"/camping_trips/show_trip"
            end
        else
            redirect to '/login'
        end
    end

    get '/trips/:id/edit' do
        if logged_in?
            @trip = CampingTrip.find_by_id(params[:id])
            if @trip.camper_id == current_user.id
            erb :"/camping_trips/edit_trip"
            end
        else
            redirect to '/login'
        end
    end

    patch '/trips/:id' do
        if logged_in?
        @trip = CampingTrip.find_by_id(params[:id])
            if @trip.camper_id == current_user.id
                if @trip.update(params[:trip])
                redirect to "/trips/#{@trip.id}"
                else
                redirect to "/trips/#{@trip.id}/edit"
                end
            else
             redirect to '/login'
            end
        end
    end

    delete '/trips/:id/delete' do
        if logged_in?
            @trip = CampingTrip.find_by_id(params[:id])
            if @trip.camper_id == current_user.id
                @trip.destroy
                redirect to '/trips'
            end
        else
            redirect to '/login'
        end
    end

end
