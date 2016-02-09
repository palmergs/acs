class Api::V1::PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    render json: @pictures
  end

end
