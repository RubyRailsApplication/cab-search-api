class Driver < ApplicationRecord
    validates :phone_number, uniqueness: true, presence: true, length: { minimum: 10,maximum: 10 }
    validates :license_number, uniqueness: true, presence: true
    validates :car_number, uniqueness: true, presence: true
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
