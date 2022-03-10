class Api::V1::NotesController < ApplicationController

    def show
        @note = Note.find(params[:id])
        render json: @note
    end

    def create
        @note = Note.new(note_params)
        if @note.valid?
            @note.save
            render json: @note, status: :created
        else
            render json: @note.errors, status: :unprocessable_entity
        end
    end

    def update
        @note = Note.find(params[:id])
        @note.update(note_params)
        render json: @note
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        render json: {}
    end

    private

    def note_params
        params.require(:note).permit(:title, :description, :notebook_id)
    end
end
