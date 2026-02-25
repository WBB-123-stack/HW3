class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    if params[:place_id]
      @place = Place.find(params[:place_id])
    end
    @entry = Entry.new
    @places = Place.all
  end

  def create
    @entry = Entry.new(entry_params)
    if params[:place_id]
      @place = Place.find(params[:place_id])
      @entry.place = @place
    end
    
    if @entry.save
      redirect_to place_path(@entry.place)
    else
      @places = Place.all
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    place = @entry.place
    @entry.destroy
    redirect_to place_path(place)
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id)
  end
end
