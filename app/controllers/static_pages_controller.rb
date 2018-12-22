class StaticPagesController < ApplicationController
    def home
    end

    def login
    end

    def signup
        @organization = Organization.new
    end
end