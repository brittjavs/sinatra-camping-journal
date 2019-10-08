class Camper < ActiveRecord::Base
    has_secure_password
    has_many :camping_trips
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
end
