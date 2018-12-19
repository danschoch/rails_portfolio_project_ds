class SessionsController < ApplicationController
    
    def new
        @employee = Employee.find(1)
    end

end