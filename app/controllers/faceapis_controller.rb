# require 'train'
# require 'graphAPI'
require 'koala'
class FaceapisController < ApplicationController
  before_action :set_faceapi, only: [:show, :edit, :update, :destroy]

  # GET /faceapis
  # GET /faceapis.json
  def index
    @faceapis = Faceapi.all
  end

  # GET /faceapis/1
  # GET /faceapis/1.json
  def show
  end

  # GET /faceapis/new
  def new
    @faceapi = Faceapi.new
  end

  # GET /faceapis/1/edit
  def edit
  end

  # POST /faceapis
  # POST /faceapis.json
  def create
    # @org = UttranceService.new
    # @graph = Koala::Facebook::API.new("EAAnfVQiL9esBACsCW4vFz2KOIVLRSRnn4MViVUy6JywHxGvHywhbvZAV5JNCRt4ZBzvZBLPzNkGocZBp9ddnQ45h308EZB9FKTdYJtcKlWY8saLjwdm9TUQLDdrTk407Jl5l1lI01HH2N4sYGva9wB1CDVZAWuQ5CC2fZC1lc9rCis5vaNdrX4DjKZAf6FRU8bAo46oSZAk3KEPFppszMcymSMnT2TyCOx0XWiYJEKofsIwZDZD")
    # data = @graph.get_connection("255791402550152","feed")
    # puts data
    # data.each do |t|
    #   if(t["id"] != "255791402550152_255791409216818")
    #     datta={
    #         message: t["message"],
    #         idd: t["id"],
    #         pheduyet: @org.get_uttrance(t["message"])
    #     }
    #     puts datta
    #     @faceapi = Faceapi.new(datta)
         @faceapi = Faceapi.new(faceapi_params)
        respond_to do |format|
          if @faceapi.save
            format.html { redirect_to @faceapi, notice: 'Faceapi was successfully created.' }
            format.json { render :show, status: :created, location: @faceapi }
          else
            format.html { render :new }
            format.json { render json: @faceapi.errors, status: :unprocessable_entity }
          end
        end
    end

  # PATCH/PUT /faceapis/1
  # PATCH/PUT /faceapis/1.json
  def update
    respond_to do |format|
      if @faceapi.update(faceapi_params)
        format.html { redirect_to @faceapi, notice: 'Faceapi was successfully updated.' }
        format.json { render :show, status: :ok, location: @faceapi }
      else
        format.html { render :edit }
        format.json { render json: @faceapi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faceapis/1
  # DELETE /faceapis/1.json
  def destroy
    @faceapi.destroy
    respond_to do |format|
      format.html { redirect_to faceapis_url, notice: 'Faceapi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faceapi
      @faceapi = Faceapi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def faceapi_params
      params.require(:faceapi).permit(:message, :id, :pheduyet)
    end
    # def data_facebook
    #   @org = UttranceService.new
    #   @dl = GraphAPI.new
    #   datta = @dl.get_data
    #   datta.each do |t|
    #     data={
    #         message: t["message"],
    #         idd: t["id"],
    #         pheduyet: @org.get_uttrance(t["message"])
    #     }
    #     puts data
    #     puts("_________")
    #   end
    # end
end
