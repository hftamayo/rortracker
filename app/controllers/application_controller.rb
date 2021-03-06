#en el video: class ApplicationController < ActionController::Base
class ApplicationController < ActionController::API
    skip_before_action :authorize_request, only: :authenticate, raise: false

    include Response
    include ExceptionHandler

    #called before every action on controllers
    before_action :authorize_request
    attr_reader :current_user

    private

    #check for valid request token and return user
    def authorize_request
        @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
end
