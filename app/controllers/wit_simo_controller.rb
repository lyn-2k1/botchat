require 'Update'
require 'unidecoder'

class WitSimoController < ApplicationController
  before_action :set_list_simo, only: [:show, :edit, :update, :destroy]
  def index
    @list_simo = List.all
    render :json=> @list_simo
  end

  def show
  end

  def new
  end

  def edit
  end

  protect_from_forgery with: :null_session
  def create

    @list_simo = List.all
    service = UpdateService.new
    data = String.new
    @list_simo.each do |key|
      service.create_synonyms(key.synonyms,key.keyword,key.entities)
      service.create_synonyms(data.to_ascii(key.synonyms),key.keyword,key.entities)
    end
    render :json =>@list_simo

  end

  def update
    puts ('i am wit')
  end

  def destroy
  end

  private
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:keyword, :synonyms, :entities)
  end
end
