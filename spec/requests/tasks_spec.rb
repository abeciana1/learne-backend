require 'rails_helper'
require 'json'

RSpec.describe "Tasks", type: :request do
  
  context "CRUD actions" do

    before(:all) do
      @task = Task.last
    end

    # describe 'CREATE' do
    #   it "should create a new task" do
    #     expect {
    #       post "/tasks", params: {
    #         task: {
    #           heading: "Task heading",
    #           description: "Task description",
    #           is_complete: true,
    #           user_id: User.last.id
    #         }
    #       }
    #     }.to change { Task.count }.from(Task.count).to(Task.count + 1)
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    describe 'READ' do
      it "should show a specific task" do
        get "/tasks/#{@task.id}"
        expect(JSON.parse(response.body)["id"]).to eq(@task.id)
      end
    end

    describe 'UPDATE' do

      it "PUT > update the entire task" do
        put "/tasks/#{@task.id}", params: {
          task: {
            heading: "updated heading",
            description: "updated description",
            is_complete: false,
            user_id: User.last.id
          }
        }
        expect(response).to have_http_status(:success)
      end

      it "PATCH > update task property" do
        put "/tasks/#{@task.id}", params: {
          task: {
            heading: "updated heading",
            description: "new description",
            is_complete: false,
            user_id: User.last.id
          }
        }
        expect(response).to have_http_status(:success)
      end

    end

    describe 'DESTROY' do
      it "DELETE > delete task" do
        expect { delete "/tasks/#{@task.id}" }.to change {
          Task.count
        }.from(Task.count).to(Task.count - 1)
        expect(JSON.parse(response.body)).to eq({})
      end
    end
    

  end

end
