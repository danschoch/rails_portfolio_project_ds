class StaticPagesController < ApplicationController
    def home
    end

    def signup
        @organization = Organization.find(1)
    end
end