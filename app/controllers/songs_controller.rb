class SongsController < ApplicationController
  before_action :set_song, only: [:name]

  def index
    @song = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if song.save
      redirect to song_path
    else
      render.new
  end

  def update
    @song = Song.find(params[:id])
    if song.update(song_params)
      redirect_to @song
    else 
      redirect_to :edit
    end
  end

  def edit
  end

  private
  
  def song_params
    params.require(:song).permit(:name, :genre)
  end


  def set_song
    params.require(:song).permit(:name)
  end
end
