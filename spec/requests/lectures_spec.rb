require 'rails_helper'
require 'json'
require 'faker'

RSpec.describe "Lectures", type: :request do
  
  context "CRUD actions" do

    before(:all) do
      @lecture = Lecture.last
    end

    # describe 'CREATE' do
    #   it "should create a new lecture" do
    #     expect {
    #       post "/api/v1/lectures", params: {
    #         lecture: {
    #           meeting_time: Faker::Date.between(from: Date.today, to: 30.days.from_now).to_s,
    #           meeting_link: "https://www.youtube.com/watch?v=vtPk5IUbdH0",
    #           meeting_name: Faker::TvShows::Seinfeld.business,
    #           meeting_description: Faker::Hipster.sentence(word_count: 5),
    #           cohort_id: Cohort.all.sample.id
    #         }
    #       }
    #     }.to change {Lecture.count}.from(Lecture.count).to(Lecture.count + 1)
    #     expect(response).to have_http_status(:success)
    #   end
    # end
    
    describe 'READ' do
      it "should get a specific lecture" do
        get "/api/v1/lectures/#{@lecture.id}"
        expect(JSON.parse(response.body)["id"]).to eq(@lecture.id)
      end
    end

    describe 'UPDATE' do
      it "PUT > should update a whole lecture" do
        put "/api/v1/lectures/#{@lecture.id}", params: {
          lecture: {
            meeting_time: Faker::Date.between(from: Date.today, to: 30.days.from_now).to_s,
            meeting_link: "https://www.youtube.com/watch?v=vtPk5IUbdH0",
            meeting_name: Faker::TvShows::Seinfeld.business,
            meeting_description: Faker::Hipster.sentence(word_count: 5),
          }
        }
        expect(response).to have_http_status(:success)
      end

      it "PATCH > should update lecture property" do
        put "/api/v1/lectures/#{@lecture.id}", params: {
          lecture: {
            meeting_description: "updated lecture description",
          }
        }
        expect(response).to have_http_status(:success)
      end

    end

    describe 'DESTROY' do
      it "should delete a lecture" do
        expect {
          delete "/api/v1/lectures/#{@lecture.id}"
        }.to change {Lecture.count}.by(-1)
        expect(JSON.parse(response.body)).to eq({})
      end
    end
    
  end
end
