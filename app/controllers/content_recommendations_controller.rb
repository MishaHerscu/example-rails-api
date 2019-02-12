class ContentRecommendationsController < ApplicationController
  before_action :set_content_recommendation, only: [:show, :update, :destroy]

  # GET /content_recommendations
  # GET /content_recommendations.json
  def index
    @content_recommendations = ContentRecommendation.all

    render json: @content_recommendations
  end

  # GET /content_recommendations/1
  # GET /content_recommendations/1.json
  def show
    render json: @content_recommendation
  end

  # POST /content_recommendations
  # POST /content_recommendations.json
  def create
    @content_recommendation = ContentRecommendation.new(content_recommendation_params)

    if @content_recommendation.save
      render json: @content_recommendation, status: :created, location: @content_recommendation
    else
      render json: @content_recommendation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /content_recommendations/1
  # PATCH/PUT /content_recommendations/1.json
  def update
    if @content_recommendation.update(content_recommendation_params)
      head :no_content
    else
      render json: @content_recommendation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /content_recommendations/1
  # DELETE /content_recommendations/1.json
  def destroy
    @content_recommendation.destroy

    head :no_content
  end

  private

    def set_content_recommendation
      @content_recommendation = ContentRecommendation.find(params[:id])
    end

    def content_recommendation_params
      params.require(:content_recommendation).permit(:user_id, :company_id)
    end
end
