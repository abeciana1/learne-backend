require 'pry'

class Api::V1::UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        render json: @user, each_serializer: UserSerializer
    end

    def profile
    end

    def session_renew
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            binding.pry
            @user.save
            token = encode_token(user_id: @user.id)
            cookies.signed[:jwt] = {value: token, httponly: true,   expires: 1.hour.from_now}
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
        else
            binding.pry
            render json: @user.errors, status: :unprocessable_entity
        end
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
