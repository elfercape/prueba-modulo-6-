class Offer < ApplicationRecord
    #before_action :authenticate_user!, except: [ :index ]
    #before_action :set_offer, only: %i[ show edit update destroy ]

    #before_action only: [ :new, :create, :edit, :update, :destroy ] do
    #authorize_request([ "author", "admin" ])
    #end
    class OffersController < ApplicationController
        before_action :authenticate_user!, except: [:index]
        before_action :set_offer, only: %i[show edit update destroy]
        before_action :authorize_request, only: [:new, :create, :edit, :update, :destroy]
      
        def index
          @offers = Offer.all
        end
      
        def show
        end
      
        def new
          @offer = Offer.new
        end
      
        def create
          @offer = Offer.new(offer_params)
          if @offer.save
            redirect_to @offer, notice: 'Offer was successfully created.'
          else
            render :new
          end
        end
      
        def edit
        end
      
        def update
          if @offer.update(offer_params)
            redirect_to @offer, notice: 'Offer was successfully updated.'
          else
            render :edit
          end
        end
      
        def destroy
          @offer.destroy
          redirect_to offers_path, notice: 'Offer was successfully destroyed.'
        end
      
        private
      
        def set_offer
          @offer = Offer.find(params[:id])
        end
      
        def authorize_request
          allowed_roles = ["author", "admin"]
          unless allowed_roles.include?(current_user.role)
            flash[:alert] = "You are not authorized to perform this action."
            redirect_to offers_path # Redirige a la lista de ofertas si no está autorizado.
          end
        end
      
        def offer_params
          params.require(:offer).permit(:title, :description, :active, :limit)
        end
    end
end    