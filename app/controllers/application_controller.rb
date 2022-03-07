class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken

    before_action :ensure_json_request

    def ensure_json_request
			unless request.headers["Accept"] =~ /json/
				render :nothing => true, :status => 406
			else
				unless request.get?
					return if request.headers["Content-type"] =~ /json/
					render :nothing => true, :status => 415
				end
			end
    end
end
