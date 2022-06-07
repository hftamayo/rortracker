class ProjectsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :create

    #http_basic_authenticate_with name: "hftamayo", password: "secret"

    #get /projects
    def index
        @projects = current_user.projects
        respond_to do |format|
            format.html
            format.json { render json: @projects.to_json(include: :milestones) }
        end
    end

    def create
        @project = current_user.projects.create!(project_params)
        json_response(@project, :created)
    end

    private
    def project_params
        params.permit(:title)
    end
end
