require 'oauth/consumer'
class RecommendController < ApplicationController

  def index
    @sina_statuses = SinaStatus.find(:all, :limit => 10 , :offset => 0)
    @sina_users = SinaUser.find(:all)

    @other_statuses = SinaStatus.find(:all, :limit => 10 , :offset => 5)
  end

  def consumer
    ::OAuth::Consumer.new("3130307956", "1307331b10f6278d847292f6f4c342e0", :site => "http://api.t.sina.com.cn")
  end

  def request_token
     @request_token = consumer.get_request_token
       session[:request_token] = @request_token.token
       session[:request_token_secret] = @request_token.secret
       redirect_to @request_token.authorize_url(:oauth_callback => 'http://166.111.137.21:3000/callback.jsp')
  end

  def access_token
    request_token = OAuth::RequestToken.new(
      consumer,
      session[:request_token],
      session[:request_token_secret]
    )
    access_token = request_token.get_access_token(:oauth_verifier=>params["oauth_verifier"])
     session[:access_token] = access_token.token
    session[:access_token_secret] = access_token.secret
    
  end

  def new_message
    access_token = OAuth::AccessToken.new(consumer, session[:access_token],session[:access_token_secret])
      url="http://api.t.sina.com.cn/statuses/update.xml"
      message="test"
      response = access_token.request(:post, url, :status=>message)
  end

  def testajax
    @tests = SinaUser.all
    render :partial => "testajax"
  end
end
