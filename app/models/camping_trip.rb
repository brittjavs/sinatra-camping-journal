class CampingTrip < ActiveRecord::Base
    belongs_to :camper
    validates :park, :campground, presence: true
end
