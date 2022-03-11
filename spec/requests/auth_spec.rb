require 'rails_helper'
require 'pry'

RSpec.describe "Auth", type: :request do

    context "Logging in user" do
        before(:all) do
            @user = User.last
        end

        # it "A user should be able to log in" do
        #     # binding.pry
        #     post "/api/v1/login", params: {
        #         user: {
        #             email: @user.email,
        #             password: @user.password_digest
        #         }
        #     }
        # end
    end

end