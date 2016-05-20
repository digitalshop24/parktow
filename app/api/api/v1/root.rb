module API
  module Entities
    class Base < Grape::Entity
      format_with :timestamp do |date|
        date.strftime('%Y-%m-%dT%H:%M:%S') if date
      end
      format_with :location do |location|
        {
          latitude: location.x,
          longitude: location.y
        }
      end
    end
  end
end

module SharedParams
  extend Grape::API::Helpers

  params :location do
    requires :latitude, type: Float, desc: 'Широта'
    requires :longitude, type: Float, desc: 'Долгота'
  end

  params :pagination do
    optional :page, type: Integer
    optional :per_page, type: Integer
  end
end

module API
  module V1
    class Root < Grape::API
      format :json
      content_type :json, "application/json;charset=UTF-8"
      version 'v1'
      rescue_from :all, backtrace: true
      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({ ru: "Такая запись не найдена", en: "This record does not exists" }, 404)
      end
      error_formatter :json, ::API::ErrorFormatter
      mount API::V1::Devices
      mount API::V1::Evacuators
      mount API::V1::Parkings
    end
  end
end
