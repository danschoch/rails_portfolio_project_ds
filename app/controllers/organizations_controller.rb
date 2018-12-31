class OrganizationsController < ApplicationController

    def index
    end
    
    def new
    end

    def create
        @new_org = Organization.new(organization_params)

        if @new_org.save
            redirect_to new_organization_employee_path(@new_org)
        else
            render 'static_pages/signup'
        end
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
