class SongsController < ApplicationController
  before_action :load_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
    session[:most_recent_song_id] = @songs.last.id
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "Song was successfully created!"
    else
      flash[:error] = "Song is missing a title."
    end
    redirect_to songs_path
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to songs_path
    else
      render :edit
    end
  end

  def destroy
    @song.delete
    redirect_to songs_path
  end

  private

    def song_params
      params.require(:song).permit(:title, :artist)
    end

    def load_song
      @song = Song.find(params[:id])
    end
end
