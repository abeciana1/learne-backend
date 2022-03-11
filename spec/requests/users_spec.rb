require 'rails_helper'
require 'json'

RSpec.describe "Users", type: :request do
  
  context "CRUD actions for User" do

    before(:all) do
      @user = User.last
    end
    
    describe "Create" do
      it "POST endpoint works — can create a new user" do
        expect {post "/api/v1/users", params: {
          user: {
            f_name: "John",
            l_name: "Doe",
            email: "john2@example.com",
            is_teacher: true,
            password: "1234"
          }
        }}.to change {User.count}.from(User.count).to(User.count + 1)
        expect(response).to have_http_status(:created)
      end
    end

    describe 'Show' do
      it "GET endpoint for specific user" do
        get "/api/v1/users/#{@user.id}"
        expect(JSON.parse(response.body)["id"]).to eq(@user.id)
      end
    end
    
    describe 'Update' do
      
      it "PUT > update entire user" do
        put "/api/v1/users/#{@user.id}", params: {
          user: {
            f_name: "John updated",
            l_name: "Doe updated",
            email: "john@gmail.com",
            is_teacher: false,
          }
        }
        expect(response).to have_http_status(:success)
      end

      it "PATCH > update user property" do
        put "/api/v1/users/#{@user.id}", params: {
          user: {
            is_teacher: true,
          }
        }
        expect(response).to have_http_status(:success)
      end

    end
    
    describe 'Destroy' do
      it "DELETE > delete a specific user" do
        delete "/api/v1/users/#{@user.id}"
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to eq({})
      end
    end
    
  end

end