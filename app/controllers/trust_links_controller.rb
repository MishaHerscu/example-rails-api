class TrustLinksController < ApplicationController
  before_action :set_trust_link, only: [:show, :update, :destroy]

  # GET /trust_links
  # GET /trust_links.json
  def index
    @trust_links = TrustLink.all

    render json: @trust_links
  end

  # GET /trust_links/1
  # GET /trust_links/1.json
  def show
    render json: @trust_link
  end

  # POST /trust_links
  # POST /trust_links.json
  def create
    @trust_link = TrustLink.new(trust_link_params)

    if @trust_link.save
      render json: @trust_link, status: :created, location: @trust_link
    else
      render json: @trust_link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trust_links/1
  # PATCH/PUT /trust_links/1.json
  def update
    if @trust_link.update(trust_link_params)
      head :no_content
    else
      render json: @trust_link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trust_links/1
  # DELETE /trust_links/1.json
  def destroy
    @trust_link.destroy

    head :no_content
  end

  private

    def set_trust_link
      @trust_link = TrustLink.find(params[:id])
    end

    def trust_link_params
      params.require(:trust_link).permit(:user_id, :user_id, :trust_type_id)
    end
end
