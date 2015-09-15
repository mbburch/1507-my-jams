class ApplicationController < ActionController::Base
  helper_method :most_recent_song
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def most_recent_song
    #load most recent song using session.
    Song.find_by(id: session[:most_recent_song_id])
  end

end
