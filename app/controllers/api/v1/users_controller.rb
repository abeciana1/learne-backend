require 'pry'

class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create, :session_renew, :check_email, :change_password]
    skip_before_action :authorized, only: [:create, :session_renew]
    before_action :authorized, only: [:show], if: -> { @current_user }

    def show
        @user = User.find(params[:id])
        render json: @user, each_serializer: UserSerializer
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def session_renew
        user_id = current_user[:id]
        token = encode_token({ user_id: user_id })
        cookies.signed[:jwt] = {value: token, httponly: true,   expires: 1.hour.from_now}
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            token = encode_token(user_id: @user.id)
            cookies.signed[:jwt] = {value: token, httponly: true,   expires: 1.hour.from_now}
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def check_email
    end

    def change_password
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user, each_serializer: UserSerializer
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {}
    end

    private

    def user_params
        params.require(:user).permit(:f_name, :l_name, :email, :is_teacher, :password, :reset_password)
    end
end
