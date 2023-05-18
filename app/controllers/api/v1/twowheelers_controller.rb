class Api::V1::TwowheelersController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  before_action :set_twowheeler, only: %i[show update destroy]

  def index
    @twowheelers = Twowheeler.all
    render json: @twowheelers
  end

  def show
    render json: @twowheeler
  end

  def create
    @twowheeler = Twowheeler.new(twowheeler_params)
    if @twowheeler.save
      render json: { id: @twowheeler.id }, status: :created, location: api_v1_twowheeler_url(@twowheeler)
    else
      render json: @twowheeler.errors, status: :unprocessable_entity
    end
  end

  def update
    if @twowheeler.update(twowheeler_params)
      render json: @twowheeler
    else
      render json: @twowheeler.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    if @twowheeler.nil?
      render json: { error: 'twowheeler not found' }, status: :not_found
    else
      @twowheeler.reservations.destroy_all
      @twowheeler.destroy
      head :no_content
    end
  end

  private

  def set_twowheeler
    @twowheeler = Twowheeler.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'twowheeler not found' }, status: :not_found
  end

  def twowheeler_params
    params.require(:twowheeler).permit(:name, :description, :image_url, :price, :model_year, :engine_type, :fuel_type)
  end
end
