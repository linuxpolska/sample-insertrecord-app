class ApplicationController < ActionController::Base
    
    before_action :load_variables

    def load_variables
        @title = Rails.application.config.application_title || I18n.t(:app_title)
    end

end
