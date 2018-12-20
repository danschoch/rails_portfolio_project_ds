class StaticPagesController < ApplicationController
    def home
    end

    def login
    end

    def signup
        @organization = Organization.find(1)
    end
end