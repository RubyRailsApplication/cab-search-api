class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    def process_action(*args)
        super
      rescue ActionDispatch::Http::Parameters::ParseError => exception
        render status: 400, json: { errors: [ "Invalid JSON format"] }
    end
end
