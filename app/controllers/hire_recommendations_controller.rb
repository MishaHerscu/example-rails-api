class HireRecommendationsController < ApplicationController
  before_action :set_hire_recommendation, only: [:show, :update, :destroy]

  # GET /hire_recommendations
  # GET /hire_recommendations.json
  def index
    @hire_recommendations = HireRecommendation.all

    render json: @hire_recommendations
  end

  # GET /hire_recommendations/1
  # GET /hire_recommendations/1.json
  def show
    render json: @hire_recommendation
  end

  # POST /hire_recommendations
  # POST /hire_recommendations.json
  def create
    @hire_recommendation = HireRecommendation.new(hire_recommendation_params)

    if @hire_recommendation.save
      render json: @hire_recommendation, status: :created, location: @hire_recommendation
    else
      render json: @hire_recommendation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hire_recommendations/1
  # PATCH/PUT /hire_recommendations/1.json
  def update
    if @hire_recommendation.update(hire_recommendation_params)
      head :no_content
    else
      render json: @hire_recommendation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hire_recommendations/1
  # DELETE /hire_recommendations/1.json
  def destroy
    @hire_recommendation.destroy

    head :no_content
  end

  private

    def set_hire_recommendation
      @hire_recommendation = HireRecommendation.find(params[:id])
    end

    def hire_recommendation_params
      params.require(:hire_recommendation).permit(:user_id, :company_id)
    end
end
