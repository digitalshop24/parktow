module API
  module Entities
    class Parking < Base
      expose :id, documentation: {type: Integer,  desc: "ID парковки"}
      expose :created_at, documentation: {type: String,  desc: "Дата парковки"}
      expose :location, documentation: {type: Integer,  desc: "Положение"}, format_with: :location
    end
  end
end

module API
  module V1
    class Parkings < Grape::API
      helpers SharedParams
      helpers do
        include API::AuthHelper
        include API::ErrorMessagesHelper
      end

      before do
        error!(error_message(:auth), 401) unless authenticated
      end

      resource :parkings, desc: 'Парковки' do
        desc "Припарковаться"
        params do
          use :location
        end
        post do
          parking = current_device.parkings.create(location: "POINT(#{params[:latitude]} #{params[:longitude]})")
          present parking, with: API::Entities::Parking
        end

        desc "Где припарковался?"
        get '/current' do
          parking = current_device.current_parking
          error!({ ru: 'Вы не парковались', en: 'There is no active parking' }, 404) unless parking
          present parking, with: API::Entities::Parking
        end
        
        desc "Отпарковаться"
        delete '/current' do
          parking = current_device.current_parking.deactivate
          present :status, 'ok'
        end
      end

    end
  end
end
