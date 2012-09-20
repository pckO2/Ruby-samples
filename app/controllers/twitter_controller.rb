class TwitterController < ApplicationController
  def main
  	require 'twitter'

    @selectedUser = ''
  	@myTweets = Array.new
    @userTweets = Array.new

    @threeTweets = Twitter.user_timeline('pc_kO2_tech', :count => '3')

    @threeTweets.each do |tw|
		  @myTweets.push(tw.text)
  	end


    if(!params.nil? && !params[:user].nil? && !params[:user].empty?)

        @selectedUser = params[:user]
        @threeUserTweets = Twitter.user_timeline(params[:user], :count => '3')

        @threeUserTweets.each do |tw|
          @userTweets.push(tw.text)
        end
    end
  end
end