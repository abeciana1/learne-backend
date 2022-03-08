require 'rails_helper'
require 'json'
require 'pry'

RSpec.describe "Notebooks", type: :request do
  context "CRUD actions" do

    before(:all) do
      @notebook = Notebook.last
    end
    
    # describe 'CREATE' do
    #   it "should create a new notebook" do
    #     expect { 
    #       post "/notebooks", params: {
    #         notebook: {
    #           heading: "New Notebook",
    #           description: "notebook description",
    #           user_id: User.first.id
    #         }
    #       }
    #     }.to change {Notebook.count}.from(Notebook.count).to(Notebook.count + 1)
    #     expect(response).to have_http_status(:created)
    #   end
    # end

    describe 'READ' do
      it "should get a notebook" do
        get "/notebooks/#{@notebook.id}"
        expect(JSON.parse(response.body)["id"]).to eq(@notebook.id)
      end
    end
    
    describe 'UPDATE' do
      it "PUT > should update a whole notebook" do
        put "/notebooks/#{@notebook.id}", params: {
          notebook: {
            heading: "Notebook updated",
            description: "notebook description updated",
          }
        }
        expect(response).to have_http_status(:success)
      end

      it "PATCH > should update a whole notebook" do
        put "/notebooks/#{@notebook.id}", params: {
          notebook: {
            heading: "Notebook heading",
          }
        }
        expect(response).to have_http_status(:success)
      end
    end
    
    describe 'DESTROY' do
      it "should delete a notebook" do
        expect {
          delete "/notebooks/#{@notebook.id}"
        }.to change {Notebook.count}.by(-1)
        expect(response).to have_http_status(:success)
      end
    end
    
    
  end
end
