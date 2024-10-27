class PostulationsController < ApplicationController
  before_action :authenticate_user!

  # GET /postulations or /postulations.json
  def index
    @postulations = Postulation.all
  end

  # GET /postulations/1 or /postulations/1.json
  def show
  end

  # GET /postulations/new
  def new
    @postulation = Postulation.new
  end

  # GET /postulations/1/edit
  def edit
  end

  # POST /postulations or /postulations.json
  def create
    # Solo Esteban puede hacer postulaciones.
    if current_user.admin?
      @postulation = Postulation.new(postulation_params)
      @postulation.user = current_user # Asigna el usuario actual a la postulación
      
      if @postulation.save
        redirect_to job_offer_path(@postulation.job_offer), notice: 'Postulación enviada.'
      else
        redirect_to job_offer_path(@postulation.job_offer), alert: 'Error al enviar la postulación.'
      end
    else
      redirect_to root_path, alert: 'Acceso denegado.'
    end    
  end

  # PATCH/PUT /postulations/1 or /postulations/1.json
  def update
    respond_to do |format|
      if @postulation.update(postulation_params)
        format.html { redirect_to @postulation, notice: "Postulation was successfully updated." }
        format.json { render :show, status: :ok, location: @postulation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulations/1 or /postulations/1.json
  def destroy
    @postulation.destroy!

    respond_to do |format|
      format.html { redirect_to postulations_path, status: :see_other, notice: "Postulation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulation
      @postulation = Postulation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postulation_params
      params.require(:postulation).permit(:job_offer_id)
    end
  end