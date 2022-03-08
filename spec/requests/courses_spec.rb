require 'pry'
require 'rails_helper'
require 'json'

RSpec.describe "Courses", type: :request do
  
  context "GET /index" do

    it "returns http status" do
      get "/api/v1/courses"
      expect(response).to have_http_status(:success)
    end

  end

  context "POST SHOW PUT PATCH DELETE" do

    before(:all) do
      @course = Course.last
      @teacher = User.all.select do |user|
        user.is_teacher == true
      end
    end

    # it "check that a course can be created" do
    #   expect { 
    #     post "/api/v1/courses", params: { course: {
    #       name: "New Course",
    #       subject: "New Course subject",
    #       description: "New Course description",
    #       price: 5.99,
    #       teacher_id: @teacher.sample.id
    #       }
    #     }
    #   }.to change { Course.count }.from(Course.count).to(Course.count + 1)
    #   expect(response).to have_http_status(:created)
    # end
    
    it "Show > returns course" do
      get "/api/v1/courses/#{@course.id}"
      expect(JSON.parse(response.body)["id"]).to eq(@course.id)
    end

    it "PUT > update the entire course" do
      put "/api/v1/courses/#{@course.id}", params: {
        course: {
          name: "New Course update",
          subject: "New Course subject update",
          description: "updated description",
          price: 7.99
        }
      }
      expect(response).to have_http_status(:success)
    end

    it "PATCH > update property in course" do
      patch "/api/v1/courses/#{@course.id}", params: {
        course: {
          price: 9.99
        }
      }
      
      expect(response).to have_http_status(:success)
    end

    it "DELETE > delete a course" do
      delete "/api/v1/courses/#{@course.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({})
    end

  end

end
