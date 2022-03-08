require 'pry'

class Api::V1::CoursesController < ApplicationController

    def index
        @courses = Course.all
        render json: @courses, status: 200
    end

    def show
        @course = Course.find(params[:id])
        render json: @course
    end

    def create
        @new_course = Course.new(course_params)
        if @new_course.valid?
            @new_course.save
            render json: @new_course, status: :created
        else
            render json: @new_course.errors, status: :unprocessable_entity
        end
    end

    def update
        @course = Course.find(params[:id])
        @course.update(course_params)
        render json: @course
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        render json: {}
    end

    private

    def course_params
        params.require(:course).permit(:name, :subject, :description, :price, :teacher_id)
    end

end
