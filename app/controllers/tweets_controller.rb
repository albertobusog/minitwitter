class TweetsController < ApplicationController
    def index 
        @user = user
        @tweets = @user.tweets
       # render json: @tweets
    end

    def show
        @tweet = user.tweets.find(params[:id])
        render json: @tweet
    end

    def create
        @tweet = user.tweets.create(content: params[:content], likes: 0)
        render json: @tweet
    end
    
    private
    def user
        User.find(params[:user_id])
    

end
