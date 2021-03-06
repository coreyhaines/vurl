class TwitterController < ApplicationController
  def index
    tweets
    render :index, layout: false
  end

  def tweets
    search_for = params[:search_for].present? ? params[:search_for] : 'vurlme OR vurl.me'
    search = Twitter::Search.new.q(search_for)
    if params[:tweet_id]
      search.since(params[:tweet_id])
    else
      search
    end
  rescue Timeout::Error, Crack::ParseError, EOFError, SocketError, SystemCallError
    render nothing: true
  end
  helper_method :tweets
  hide_action   :tweets
end
