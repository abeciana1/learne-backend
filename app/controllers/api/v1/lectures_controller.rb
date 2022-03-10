class Api::V1::LecturesController < ApplicationController

    def show
        @lecture = Lecture.find(params[:id])
        render json: @lecture, each_serializer: LectureSerializer
    end

    def create
        @lecture = Lecture.new(lecture_params)
        if @lecture.valid?
            @lecture.save
            render json: { lecture: LectureSerializzer.new(@lecture) }, status: :created
        else
            render json: @lecture.errors, status: :unprocessable_entity
        end
    end

    def update
        @lecture = Lecture.find(params[:id])
        @lecture.update(lecture_params)
        render json: @lecture, each_serializer: LectureSerializer
    end

    def destroy
        @lecture = Lecture.find(params[:id])
        @lecture.destroy
        render json: {}
    end

    private

    def lecture_params
        params.require(:lecture).permit(:meeting_time, :meeting_link, :meeting_name, :meeting_description, :cohort_id)
    end
end
