module API
  module Entities
    class Evacuator < Base
      expose :id, documentation: {type: Integer,  desc: "ID эвакуатора"}
      expose :last_seen, documentation: {type: String,  desc: "Эвакуатор видели последний раз"}
      expose :location, documentation: {type: Integer,  desc: "Положение"}, format_with: :location
    end
  end
end

module API
  module V1
    class Evacuators < Grape::API

      helpers SharedParams

      resource :evacuators, desc: 'Эвакуаторы' do
        desc "Получить список эвакуаторов"
        params do
          use :location
          optional :radius, type: Integer, desc: 'Радиус (метров, 500 по умолчанию)'
        end
        get do
          latitude, longitude = params[:latitude], params[:longitude]
          radius = params[:radius] || 500
          evacuators = Evacuator.where(active: true).where("ST_DWithin(location, ST_GeographyFromText('POINT(#{latitude} #{longitude})'), #{radius})")
          present :total, evacuators.count
          present :items, evacuators, with: API::Entities::Evacuator
        end

        desc "Сообщить об эвакуаторе"
        params do
          use :location
        end
        post do
          evacuator = Evacuator.create(location: "POINT(#{params[:latitude]} #{params[:longitude]})")
          present :status, 'ok'
          present :evacuator, evacuator
        end
      end
    end
  end
end
