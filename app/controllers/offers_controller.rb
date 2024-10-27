class OffersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_esteban, only: [:new, :create]
  before_action :set_offer, only: %i[show edit update destroy]

  # GET /offers or /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1 or /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user # Asigna el creador como el usuario actual

    if @offer.save
      redirect_to offers_path, notice: 'Oferta laboral creada.'
    else
      render :new
    end
  end

  # GET /offers/1/edit
  def edit
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: "Oferta actualizada con éxito." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy!

    respond_to do |format|
      format.html { redirect_to offers_path, status: :see_other, notice: "Oferta eliminada con éxito." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def authorize_esteban
      redirect_to root_path, alert: 'Acceso denegado.' unless current_user.admin?
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:title, :description)
    end
end

