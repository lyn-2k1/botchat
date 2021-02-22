require 'train'
class UttrancesController < ApplicationController
  before_action :set_uttrance, only: [:show, :edit, :update, :destroy]

  # GET /uttrances
  # GET /uttrances.json
  def index
    @uttrances = Uttrance.all
  end

  # GET /uttrances/1
  # GET /uttrances/1.json
  def show
  end

  # GET /uttrances/new
  def new
    @uttrance = Uttrance.new
  end

  # GET /uttrances/1/edit
  def edit
  end

  # POST /uttrances
  # POST /uttrances.json
  def create

    @uttrance = Uttrance.new(uttrance_params)
    # @uttrance = Uttrance.new(data_facebook)
    respond_to do |format|
      if @uttrance.save
        format.html { redirect_to @uttrance, notice: 'Uttrance was successfully created.' }
        format.json { render :show, status: :created, location: @uttrance }
      else
        format.html { render :new }
        format.json { render json: @uttrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uttrances/1
  # PATCH/PUT /uttrances/1.json
  def update
    respond_to do |format|
      if @uttrance.update(uttrance_params)
        format.html { redirect_to @uttrance, notice: 'Uttrance was successfully updated.' }
        format.json { render :show, status: :ok, location: @uttrance }
      else
        format.html { render :edit }
        format.json { render json: @uttrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uttrances/1
  # DELETE /uttrances/1.json
  def destroy
    @uttrance.destroy
    respond_to do |format|
      format.html { redirect_to uttrances_url, notice: 'Uttrance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uttrance
      @uttrance = Uttrance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uttrance_params
      params.require(:uttrance).permit(:message, :confidence)
    end
    def data_facebook
      @org = UttranceService.new
      @dl = GraphAPI.new
      datta = @dl.get_data
      datta.each do |t|
        data={
            message: t[:message],
            idd: t[:idd],
            pheduyet: @org.get_uttrance(t[:message])
        }
        return data
      end
      # if @org.get_uttrance(uttrance_params[:message])
      #   data={
      #       message: uttrance_params[:message],
      #       confidence: @org.get_uttrance(uttrance_params[:message])
      #   }
      # else
      #   data={
      #       message: uttrance_params[:message],
      #       confidence: 0
      #   }
      # end
    end
end
