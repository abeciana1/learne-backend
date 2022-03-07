class TasksController < ApplicationController

    def show
        @task = Task.find(params[:id])
        render json: @task
    end

    def create
        @task = Task.new(task_params)
        if @task.valid?
            @task.save
            render json: @task, status: :created
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        render json: @task
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        render json: {}
    end

    private

    def task_params
        params.require(:task).permit(:heading, :description, :due_date, :is_complete, :user_id)
    end

end
