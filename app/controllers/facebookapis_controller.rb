class FacebookapisController < ApplicationController
  before_action :set_facebookapi, only: [:show, :edit, :update, :destroy]

  # GET /facebookapis
  # GET /facebookapis.json
  def index
    @facebookapis = Facebookapi.all
  end

  # GET /facebookapis/1
  # GET /facebookapis/1.json
  def show
  end

  # GET /facebookapis/new
  def new
    @facebookapi = Facebookapi.new
  end

  # GET /facebookapis/1/edit
  def edit
  end

  # POST /facebookapis
  # POST /facebookapis.json
  def create
    @facebookapi = Facebookapi.new(facebookapi_params)

    respond_to do |format|
      if @facebookapi.save
        format.html { redirect_to @facebookapi, notice: 'Facebookapi was successfully created.' }
        format.json { render :show, status: :created, location: @facebookapi }
      else
        format.html { render :new }
        format.json { render json: @facebookapi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebookapis/1
  # PATCH/PUT /facebookapis/1.json
  def update
    respond_to do |format|
      if @facebookapi.update(facebookapi_params)
        format.html { redirect_to @facebookapi, notice: 'Facebookapi was successfully updated.' }
        format.json { render :show, status: :ok, location: @facebookapi }
      else
        format.html { render :edit }
        format.json { render json: @facebookapi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebookapis/1
  # DELETE /facebookapis/1.json
  def destroy
    @facebookapi.destroy
    respond_to do |format|
      format.html { redirect_to facebookapis_url, notice: 'Facebookapi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebookapi
      @facebookapi = Facebookapi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def facebookapi_params
      params.require(:facebookapi).permit(:post, :pheduyet)
    end
end
