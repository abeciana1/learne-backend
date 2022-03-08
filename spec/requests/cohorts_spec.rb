require 'rails_helper'

RSpec.describe "Cohorts", type: :request do

  context "CRUD actions" do

    before(:all) do
      @cohort = Cohort.last
    end

    describe 'CREATE' do
      it "should create a new cohort" do
        expect { 
          post "/cohorts", params: {
            cohort: {
              student_id: 12,
              course_id: 4
            }
          }
        }.to change {Cohort.count}.by(1)
        expect(response).to have_http_status(:created)
      end
    end
    
    describe 'READ' do
      it "should access a cohort" do
        get "/cohorts/#{@cohort.id}"
        expect(response).to have_http_status(:success)
      end
    end
    
    describe 'UPDATE' do
      it "PUT & PATCH > should update a whole cohort" do
        put "/cohorts/#{@cohort.id}", params: {
          cohort: {
            course_id: 10
          }
        }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'DESTROY' do
      it "should destroy a cohort" do
        expect {
          delete "/cohorts/#{@cohort.id}"
        }.to change {Cohort.count}.by(-1)
        expect(response).to have_http_status(:success)
      end
    end
    
    

  end
end
