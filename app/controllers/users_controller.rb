class UsersController < ApplicationController

    def index
       @users = User.all
       #render json: @users
    end

    def show 
        #p params
        @user = User.find(params[:id])
       # render json: @user
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found'}
    end

    def create
        @user = User.new(
            username: params[:username],
            password: params[:password],
            password_confirmation: params[:password_confirmation],
            full_name: params[:full_name]
        )
        if @user.save
            #render json: @user
        else 
            render json: @user.errors.full_messages
        end
               
    end

end
