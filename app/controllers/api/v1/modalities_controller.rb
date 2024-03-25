class Api::V1::ModalitiesController < ApplicationController
  before_action :authorize_request

  # GET /modalities
  def index
    @modalities = Modality.all
    render json: @modalities, status: :ok
  end


  # GET /modalities/{id}
  def show
    render json: @modality, status: :ok
  end
  

  # POST /modalities
  def create
    @modality = Modality.new(modality_params)
    if @modality.save
      render json: @modality, status: :created
    else
      render json: { errors: @modality.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /modalities/{id}
  def update
    unless @modality.update(modality_params)
      render json: { errors: @modality.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /modalities/{id}
  def destroy
    @modality.destroy
  end

  private

  def find_modaity
    @modality = Modality.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Modality not found' }, status: :not_found
  end

  def modality_params
    params.permit(
      :name, :players, :status
    )
  end
end
