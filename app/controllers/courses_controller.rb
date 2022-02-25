

class CoursesController < ApplicationController

    def index
        @courses = Course.all
        render json: @courses, status: :created
    end

end
