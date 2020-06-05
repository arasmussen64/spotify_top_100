class ArtistsController < ApplicationController
  before_action :set_song
  
  def index
    @artists = Artist.all
  end

  def new
    @artists = Artist.all - @song.billboards
    @artist = @song.artists.new
  end

  def create
    @artist = @song.artists.new(artist_params)
    if @artist.save
      redirect_to song_artists_path(@song)
    else
      render :new
    end
  end

  def destroy
    @artist = @song.artists.find(params[:id])
    @artist.destroy
    redirect_to song_artists_path(@song)
  end

  private
  def set_song
    @song = Song.find(params[:song_id])
  end 

  def artist_params
    params.require(:artists).permit(:billboard_id)
  end
end
