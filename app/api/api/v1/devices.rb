module API
  module V1
    class Devices < Grape::API
      helpers do
        include API::ErrorMessagesHelper
      end

      resource :devices, desc: 'Девайсы' do
        desc "Зарегистрировать устройство"
        params do
          requires :token, type: String, desc: "Токен устройства"
        end
        post do
          device = Device.where(token: params[:token]).first_or_create
          present device
        end
      end

      resource :devices, desc: 'Девайсы' do
        desc "Удалить устройство"
        params do
          requires :token, type: String, desc: "Токен устройства"
        end
        delete do
          device = Device.find_by(token: params[:token])

          device.destroy if device
          present :status, 'ok'
        end
      end

    end
  end
end
