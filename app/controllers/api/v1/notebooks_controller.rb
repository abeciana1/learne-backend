require 'pry'

class Api::V1::NotebooksController < ApplicationController

    def show
        @notebook = Notebook.find(params[:id])
        render json: @notebook
    end

    def create
        @notebook = Notebook.new(notebook_params)
        if @notebook.valid?
            @notebook.save
            render json: @notebook, status: :created
        else
            render json: @notebook.errors, status: :unprocessable_entity
        end
    end

    def update
        @notebook = Notebook.find(params[:id])
        @notebook.update(notebook_params)
        render json: @notebook
    end

    def destroy
        @notebook = Notebook.find(params[:id])
        @notebook.destroy
        render json: {}
    end

    private

    def notebook_params
        params.require(:notebook).permit(:heading, :description, :user_id)
    end

end
