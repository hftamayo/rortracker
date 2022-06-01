class ProjectsController < ApplicationController

    http_basic_authenticate_with name: "hftamayo", password: "secret"

    #get /projects
    def index
        @projects = Project.all
        render json: @projects
    end
end
