class CampingTrip < ActiveRecord::Base
    belongs_to :camper
    validates :date_camped, :park, :campground, presence: true
end
