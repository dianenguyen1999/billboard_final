class ArtistsController < ApplicationController
  before_action :set_artists, only: [:show, :edit, :destroy]
  def index
    @artist = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if artist.save
      redirect_to artist_path
    else
      render.new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if artist.update(artist_params) 
      redirect_to @artist
    else
      redirect_to :edit
    end
  end

  
  def edit
  end

  
  
  private
    def artists_params
      params.require(:artist).permit(:name, :genre)
    end
  
    def set_artist
      @artist = Artist.find(params[:id])
    end
end

