class ApplicationController < ActionController::Base
  helper_method :current_user

  protect_from_forgery with: :exception

  # def most_recent_song
  #     Song.find(id: session[:most_recent_song_id])
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

end
