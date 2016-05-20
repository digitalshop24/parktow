class Device < ActiveRecord::Base
  has_many :parkings, dependent: :nullify
  has_one :current_parking, ->{ where(active: true).order(created_at: :desc) }, class_name: "Parking"
end
