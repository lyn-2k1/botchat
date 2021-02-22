require 'train'

class TrainbotsController < ApplicationController
  before_action :set_trainbot, only: [:show, :edit, :update, :destroy]

  # GET /trainbots
  # GET /trainbots.json
  def index
    @trainbots = Trainbot.all
  end

  # GET /trainbots/1
  # GET /trainbots/1.json
  def show
  end

  # GET /trainbots/new
  def new
    @trainbot = Trainbot.new
  end

  # GET /trainbots/1/edit
  def edit
  end

  # POST /trainbots
  # POST /trainbots.json
  def create
    @trainbot = Trainbot.new(trainbot_params)
    @org = UttranceService.new
    @org.post_uttrance(trainbot_params[:message],trainbot_params[:intent],trainbot_params[:entity],trainbot_params[:start],trainbot_params[:end],trainbot_params[:body]
    )
    respond_to do |format|
      if @trainbot.save
        format.html { redirect_to @trainbot, notice: 'Trainbot was successfully created.' }
        format.json { render :show, status: :created, location: @trainbot }
      else
        format.html { render :new }
        format.json { render json: @trainbot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainbots/1
  # PATCH/PUT /trainbots/1.json
  def update
    respond_to do |format|
      if @trainbot.update(trainbot_params)
        format.html { redirect_to @trainbot, notice: 'Trainbot was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainbot }
      else
        format.html { render :edit }
        format.json { render json: @trainbot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainbots/1
  # DELETE /trainbots/1.json
  def destroy
    @trainbot.destroy
    respond_to do |format|
      format.html { redirect_to trainbots_url, notice: 'Trainbot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainbot
      @trainbot = Trainbot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trainbot_params
      params.require(:trainbot).permit(:message, :intent, :entity, :start, :end, :body)
    end

end
