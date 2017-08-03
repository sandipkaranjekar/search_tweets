class TweetsController < ApplicationController
  def search_with_gem
  	unless params[:searchString].blank?
  		q = query_string(params[:searchString])
  		@tweets = HashWithIndifferentAccess.new(TWITTER_CLIENT.search("##{params[:searchString]} -rt").to_hash)["statuses"] rescue nil
  	end    
    render 'tweets'
  end

  def search_without_gem
  	twitter_obj = Twitter::TwitterAPI.new
  	unless params[:searchString].blank?
  		q = query_string(params[:searchString])
	  	response = twitter_obj.search(params[:searchString])
	  	@tweets = response["statuses"] rescue nil
	  end
    render 'tweets'
  end

  private
  def query_string(q)
    (q.start_with? "#") ? q[1..-1] : q    
  end
end
