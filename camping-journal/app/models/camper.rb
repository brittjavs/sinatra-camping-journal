class Camper < ActiveRecord::Base
    has_secure_password
    has_many :camping_trips
end
