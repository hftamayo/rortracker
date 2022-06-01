class ProjectsController < ApplicationController
    #get /projects
    def index
        @projects = Project.all
        render json: @projects
end
