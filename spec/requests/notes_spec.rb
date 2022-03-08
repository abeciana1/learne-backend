require 'rails_helper'
require 'json'

RSpec.describe "Notes", type: :request do

  context "CRUD actions" do

    before(:all) do
      @note = Note.last
    end
    
    # describe 'Create a new note' do
    #   it "should create a new note" do
    #     expect {
    #       post "/api/v1/notes", params: {
    #         note: {
    #           title: "New note",
    #           description: "New note description",
    #           notebook_id: Notebook.last.id,
    #         }
    #       }
    #     }.to change {Note.count}.from(Note.count).to(Note.count + 1)
    #     expect(response).to have_http_status(:created)
    #   end
    # end
    
    describe "READ" do
      it "should get a specific note" do
        get "/api/v1/notes/#{@note.id}"
        expect(JSON.parse(response.body)["id"]).to eq(@note.id)
      end
    end

    describe 'UPDATE' do
      it "PUT > update entire note" do
        put "/api/v1/notes/#{@note.id}", params: {
          note: {
            title: "Update note title",
            description: "update note description",
          }
        }
        expect(response).to have_http_status(:success)
      end

      it "PATCH > update entire note" do
        put "/api/v1/notes/#{@note.id}", params: {
          note: {
            title: "Update note title",
            description: "update note description",
          }
        }
        expect(response).to have_http_status(:success)
      end

    end
    
    describe 'DESTROY' do
      it "DELETE > delete a note" do
        expect { 
          delete "/api/v1/notes/#{@note.id}" 
        }.to change {Note.count}.by(-1)
        expect(JSON.parse(response.body)).to eq({})
        expect(response).to have_http_status(:success)
      end
    end
    

  end

end
