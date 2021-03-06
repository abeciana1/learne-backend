class Api::V1::TasksController < ApplicationController

    def show
        @task = Task.find(params[:id])
        render json: @task, each_serializer: TaskSerializer
    end

    def create
        @task = Task.new(task_params)
        if @task.valid?
            @task.save
            render json: {task: TaskSerializer.new(@task)}, status: :created
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        render json: @task, each_serializer: TaskSerializer
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
