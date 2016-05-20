module API
  module AuthHelper

    def authenticated
      !headers['Device-Token'].to_s.empty? && @device = Device.find_by_token(headers['Device-Token'])
    end

    def current_device
      @device
    end

    def sign_out
      current_device.update_column(:token, nil)
      !!current_device
    end

  end
end
