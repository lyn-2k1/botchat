require 'Update'
class WitKeyController < ApplicationController
  before_action :set_list_key, only: [:show, :edit, :update, :destroy]
  def index
    @listkey = List.all
    render :json=> @listkey
  end

  def show
  end

  def new
  end

  def edit
  end

  protect_from_forgery with: :null_session
  def create
    @listkey = List.all
    service = UpdateService.new
    @listkey.each do |key|
      service.create_keyword(key.keyword,key.synonyms,key.entities)
    end
    render :json =>@listkey
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
