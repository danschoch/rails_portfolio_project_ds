class OrganizationsController < ApplicationController

    def index
    end
    
    def new
    end

    def create
        @new_org = Organization.create(organization_params)
        redirect_to new_organization_employee_path(@new_org)
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def organization_params
        params.require(:organization).permit(:name)
    end
end
