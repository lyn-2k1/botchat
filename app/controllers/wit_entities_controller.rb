require 'Update'
class WitEntitiesController < ApplicationController
  before_action :set_list_enti, only: [:show, :edit, :update, :destroy]
  def index
    @list_enti = List.all
    render :json=> @list_enti
  end

  def show
  end

  def new
  end

  def edit
  end

  protect_from_forgery with: :null_session
  def create

    service = UpdateService.new

    service.create_entities(params[:entities])

    render :json =>@list_enti

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
