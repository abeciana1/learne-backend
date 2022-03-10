class Api::V1::CohortsController < ApplicationController

    def show
        @cohort = Cohort.find(params[:id])
        render json: @cohort
    end

    def create
        @cohort = Cohort.new(cohort_params)
        if @cohort.valid?
            @cohort.save
            render json: @cohort, status: :created
        else
            render json: @cohort.errors, status: :unprocessable_entity
        end
    end

    def update
        @cohort = Cohort.find(params[:id])
        @cohort.update(cohort_params)
        render json: @cohort
    end

    def destroy
        @cohort = Cohort.find(params[:id])
        @cohort.destroy
        render json: {}
    end

    private

    def cohort_params
        params.require(:cohort).permit(:student_id, :course_id)
    end

end
