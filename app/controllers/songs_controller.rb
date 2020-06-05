class SongsController < ApplicationController
  before_action :set_song, only: [:show, :destroy]
  
  def index
    @song = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
