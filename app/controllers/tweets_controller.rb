class TweetsController < ApplicationController

  
  def index
    @tweets = Tweet.all.order("id DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
    redirect_to tweets_path
  end
  
  def show
    @nickname = current_user.nickname
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :text)
  end
   

end

