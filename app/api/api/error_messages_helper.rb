module API
  module ErrorMessagesHelper
    def error_message sym
      hash = {
        auth: { ru: "Вы не авторизированы", en: "You are not authorized" }
      }
      hash[sym]
    end

    def eng_format_errors hash
      res = []
      hash.each{ |key, value| res << "#{key}: #{value}" }
      res = res.join('; ')
      { ru: res, en: res }
    end
  end
end
