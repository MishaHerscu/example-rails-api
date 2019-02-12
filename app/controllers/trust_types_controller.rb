class TrustTypesController < ApplicationController
  before_action :set_trust_type, only: [:show, :update, :destroy]

  # GET /trust_types
  # GET /trust_types.json
  def index
    @trust_types = TrustType.all

    render json: @trust_types
  end

  # GET /trust_types/1
  # GET /trust_types/1.json
  def show
    render json: @trust_type
  end

  # POST /trust_types
  # POST /trust_types.json
  def create
    @trust_type = TrustType.new(trust_type_params)

    if @trust_type.save
      render json: @trust_type, status: :created, location: @trust_type
    else
      render json: @trust_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trust_types/1
  # PATCH/PUT /trust_types/1.json
  def update
    if @trust_type.update(trust_type_params)
      head :no_content
    else
      render json: @trust_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trust_types/1
  # DELETE /trust_types/1.json
  def destroy
    @trust_type.destroy

    head :no_content
  end

  private

    def set_trust_type
      @trust_type = TrustType.find(params[:id])
    end

    def trust_type_params
      params.require(:trust_type).permit(:name)
    end
end
